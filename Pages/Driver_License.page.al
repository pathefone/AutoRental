page 50116 "Driver License"
{
    Caption = 'Driver License';
    InsertAllowed = false;
    LinksAllowed = false;
    DeleteAllowed = false;
    PageType = CardPart;
    SourceTable = "Auto Rent Header";

    layout
    {
        area(content)
        {
            field("Driver License"; Rec."Driver License")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Picture")
            {
                ApplicationArea = All;
                Caption = 'Import picture';
                ToolTip = 'Import a picture file.';
                Image = Import;

                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    ClientFileName: Text;
                    FileName: Text;
                begin
                    Rec.TestField("No.");

                    if Rec."Driver License".HasValue then
                        if not Confirm(OverrideImageQst) then
                            Error('');

                    ClientFileName := '';
                    FileName := FileManagement.UploadFile(ChoosePictureTxt, ClientFileName);
                    if FileName = '' then
                        Error('');

                    Clear(Rec."Driver License");
                    Rec."Driver License".ImportFile(FileName, ClientFileName);
                    Modify(true);
                    if FileManagement.DeleteServerFile(FileName) then;
                end;
            }
            action("Delete Picture")
            {
                ApplicationArea = All;
                Caption = 'Delete picture';
                ToolTip = 'Delete the record.';
                Enabled = DeleteExportEnabled;
                Image = Delete;

                trigger OnAction()
                begin
                    Rec.TestField("No.");

                    if not Confirm(DeleteImageQst) then
                        exit;

                    Clear(Rec."Driver License");
                    Rec.Modify(true);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetEditableOnPictureActions;
    end;

    var
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
        ChoosePictureTxt: Label 'Choose picture';
        DeleteExportEnabled: Boolean;

    local procedure SetEditableOnPictureActions()
    begin
        DeleteExportEnabled := Rec."Driver License".HasValue;
    end;
}