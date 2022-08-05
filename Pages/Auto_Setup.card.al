page 50100 "Auto Setup Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Auto Setup';
    SourceTable = "Auto Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Auto Nos"; Rec."Auto Nos")
                {
                    ApplicationArea = All;
                }
                field("Rental Card Nos"; Rec."Rental Card Nos")
                {
                    ApplicationArea = All;
                }
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea = All;
                }
                field("Item Transfer No."; Rec."Item Transfer No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        RecordManipulation: Codeunit RecordManipulation;
    begin
        Rec.InsertIfNotExists();
        RecordManipulation.InsertAutoMark('BMW', 'A German car');
        RecordManipulation.InsertAutoMark('TOYOTA', 'A Japanese car');
        RecordManipulation.InsertAutoModel('BMW', 'X6', 'A black BMW X6');
        RecordManipulation.InsertAutoModel('TOYOTA', 'PRIUS', 'A hybrid prius car');
    end;

    var
        myInt: Integer;
}