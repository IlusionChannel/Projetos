object frmListarOrcamento: TfrmListarOrcamento
  Left = 0
  Top = 0
  Caption = 'Lista de Or'#231'amento'
  ClientHeight = 374
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 25
    Align = alTop
    Caption = 'Or'#231'amento'
    TabOrder = 0
  end
  object dbgListarOrcamento: TDBGrid
    Left = 0
    Top = 24
    Width = 653
    Height = 329
    Align = alCustom
    DataSource = uConexao.sourceOrcamento
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgListarOrcamentoDrawColumnCell
    OnDblClick = dbgListarOrcamentoDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 323
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacao'
        Width = 207
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 348
    Width = 653
    Height = 26
    Align = alBottom
    TabOrder = 2
    object btnExcluir: TBitBtn
      Left = 570
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 0
      OnClick = btnExcluirClick
    end
    object btnEditar: TBitBtn
      Left = 489
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnInserir: TBitBtn
      Left = 408
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 2
      OnClick = btnInserirClick
    end
  end
end
