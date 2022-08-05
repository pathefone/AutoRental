report 50101 "Auto Rent History"
{
    Caption = 'Auto Rent History';
    DefaultLayout = RDLC;
    RDLCLayout = './rdlc/AutoRentHistory.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Auto; Auto)
        {
            RequestFilterFields = "No.";

            column(AutoNo; "No.")
            {

            }
            column(Auto_Mark; "Auto Mark")
            {

            }
            column(Auto_Model; "Auto Model")
            {

            }

            dataitem("Finished Auto Rent Header"; "Finished Auto Rent Header")
            {
                DataItemLink = "Auto No." = field("No.");
                RequestFilterFields = "Reservation From", "Reservation To";

                column(Reservation_From; "Reservation From")
                {

                }
                column(Reservation_To; "Reservation To")
                {

                }
                column(Client_No_; "Client No.")
                {

                }
                column("Sum"; "Sum")
                {

                }
            }





        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; ReportDate)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    labels
    {
        AutoNoLbl = 'Auto No.';
        MarkLbl = 'Mark';
        ModelLbl = 'Model';
        ReservationFromLbl = 'Reservation From';
        ReservationToLbl = 'Reservation To';
        CustomerLbl = 'Customer';
        SumLbl = 'Sum';
        TotalLbl = 'Total';
    }



    var
        myInt: Integer;
        ReportDate: Date;

}