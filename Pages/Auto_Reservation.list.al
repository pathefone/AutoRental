page 50105 "Auto Reservation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Reservation";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                }
                field("Reservation From"; Rec."Reservation From")
                {
                    ApplicationArea = All;
                }
                field("Reservation To"; Rec."Reservation To")
                {
                    ApplicationArea = All;
                }
            }
        }



        area(Factboxes)
        {

        }
    }

    var
        DateErr: Label 'This date is already reserved!';

}