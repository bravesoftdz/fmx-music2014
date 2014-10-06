unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, Data.Bind.GenData,
  Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.Objects, FMX.StdCtrls, FMX.ListView, FMX.Layouts, FMX.MultiView,
  FMX.Memo, Fmx.Bind.Navigator, System.Actions, FMX.ActnList, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Client, REST.Response.Adapter, FMX.ListBox;

type
  TMasterDetailForm = class(TForm)
    Layout1: TLayout;
    DetailToolbar: TToolBar;
    DetailLabel: TLabel;
    MasterButton: TSpeedButton;
    MultiView1: TMultiView;
    ListView1: TListView;
    MasterToolbar: TToolBar;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTResponse1: TRESTResponse;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    FDMemTable2: TFDMemTable;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    BindSourceDB2: TBindSourceDB;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListView2: TListView;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField3: TLinkListControlToField;
    LinkPropertyToFieldItemDataDetail: TLinkPropertyToField;
    LinkPropertyToFieldItemDataDetail2: TLinkPropertyToField;
    MasterLabel: TLabel;
    Rectangle1: TRectangle;
    procedure ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MasterDetailForm: TMasterDetailForm;

implementation

{$R *.fmx}

procedure TMasterDetailForm.FormShow(Sender: TObject);
begin
  RESTRequest1.Execute;
  RESTRequest2.Params.ParameterByName('_id').Value := FDMemTable1.FieldValues['id'];
  RESTRequest2.Execute;
  MultiView1.ShowMaster;  // 시작 시 메뉴
end;

procedure TMasterDetailForm.ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  MultiView1.HideMaster;
  RESTRequest2.Params.ParameterByName('_id').Value := FDMemTable1.FieldValues['id'];
  RESTRequest2.Execute;
end;

end.
