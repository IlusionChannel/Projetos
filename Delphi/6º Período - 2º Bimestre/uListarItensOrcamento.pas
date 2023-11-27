unit uListarItensOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uTipoOperacao, uItensOrcamento;

type
  TfrmListarItemOrcamento = class(TForm)
    Panel1: TPanel;
    dbgListar: TDBGrid;
    Panel2: TPanel;
    btnExcluir: TBitBtn;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    procedure dbgListarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgListarDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Excluir;
    procedure ControlarVisibilidadeDosBotoes;
    procedure AbrirCadastro(const pTipoOperacao: TTipoOperacao);
  public
    { Public declarations }
  end;

var
  frmListarItemOrcamento: TfrmListarItemOrcamento;

implementation

{$R *.dfm}

  uses uDM, uFuncoes, System.SysUtils;

  //Define o chamado da opera��o de exclus�o
  procedure TfrmListarItemOrcamento.Excluir;
  begin
    if uConexao.queryItemOrcamento.IsEmpty then
      Exit;
    if (not Pergunta('Deseja realmente excluir a compra?')) then
      Exit;
    uConexao.queryItemOrcamento.Delete;
  end;

  procedure TfrmListarItemOrcamento.btnExcluirClick(Sender: TObject);
  begin
    Excluir;
    ControlarVisibilidadeDosBotoes;
  end;

  //Define o chamado da opera��o de inser��o
  procedure TfrmListarItemOrcamento.btnInserirClick(Sender: TObject);
  begin
    AbrirCadastro(topInserir);
    ControlarVisibilidadeDosBotoes;
  end;

  //Define o chamado da opera��o de edi��o
  procedure TfrmListarItemOrcamento.btnEditarClick(Sender: TObject);
  begin
     AbrirCadastro(topEditar);
  end;

  //Inicia o formul�rio com os dados e os bot�es controlados ao abrir a tela
  procedure TfrmListarItemOrcamento.ControlarVisibilidadeDosBotoes;
  begin
    btnEditar.Enabled := (not uConexao.queryItemOrcamento.IsEmpty);
    btnExcluir.Enabled := (not uConexao.queryItemOrcamento.IsEmpty);
  end;

  procedure TfrmListarItemOrcamento.FormActivate(Sender: TObject);
  begin
    AtivarQuery(uConexao.queryItemOrcamento, topAbrir);
    AtivarQuery(uConexao.queryOrcamento, topAbrir);
    ControlarVisibilidadeDosBotoes;
  end;

  //Ao encerrar o formul�rio, fecha a query
  procedure TfrmListarItemOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    AtivarQuery(uConexao.queryItemOrcamento, topFechar);
    AtivarQuery(uConexao.queryOrcamento, topAbrir);
  end;

  //Abre o formul�rio de compras onde iremos inserir os dados
  procedure TfrmListarItemOrcamento.AbrirCadastro(const pTipoOperacao: TTipoOperacao);
  var
    lItensOrcamento: TfrmItensOrcamento;
  begin
    lItensOrcamento := TfrmItensOrcamento.Create(nil);
    try
      lItensOrcamento.TipoOperacao := pTipoOperacao;
      lItensOrcamento.ShowModal;
    finally
      lItensOrcamento.Free;
    end;
  end;

  procedure TfrmListarItemOrcamento.dbgListarDblClick(Sender: TObject);
  begin
      AbrirCadastro(topEditar);
  end;

  //Personaliza a coluna do formul�rio para ficar zebrada
  procedure TfrmListarItemOrcamento.dbgListarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  begin
    ZebrarGrid(Sender, uConexao.queryItemOrcamento, Rect, Column, State);
  end;

end.
