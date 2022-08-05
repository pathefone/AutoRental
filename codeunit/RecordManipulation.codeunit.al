codeunit 50100 RecordManipulation
{
    procedure InsertAutoMark("Code": Code[10]; Description: Text[20])
    var
        AutoMark: Record "Auto Mark";
    begin
        AutoMark.Init();
        AutoMark."Code" := "Code";
        AutoMark.Description := Description;
        if AutoMark.Insert() <> true then
            exit;
    end;

    procedure InsertAutoModel("Auto Mark Code": Code[10]; "Code": Code[10]; Description: Text[20])
    var
        AutoModel: Record "Auto Model";
    begin
        AutoModel.Init();
        AutoModel."Auto Mark Code" := "Auto Mark Code";
        AutoModel."Code" := "Code";
        AutoModel.Description := Description;
        if AutoModel.Insert() <> true then
            exit;
    end;

    
}