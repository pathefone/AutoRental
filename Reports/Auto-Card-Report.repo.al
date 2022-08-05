report 50100 "Auto Rent Card Report"
{
    Caption = 'Auto Rent Card Report';
    DefaultLayout = RDLC;
    RDLCLayout = './rdlc/AutoRentReport.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Auto Rent Header"; "Auto Rent Header")
        {
            RequestFilterFields = "No.";
            column(AutoNo; "Auto Rent Header"."Auto No.")
            {

            }
            column(No_; "No.")
            {

            }
            dataitem("Auto"; "Auto")
            {
                DataItemLink = "No." = field("Auto No.");

                column(AutoMark; "Auto Mark")
                {

                }
                column(AutoModel; "Auto Model")
                {

                }
            }

            column(ReservationFrom; "Reservation From")
            {

            }
            column(ReservationTo; "Reservation To")
            {

            }

            column(Client_No_; "Client No.")
            {

            }

            dataitem("Customer"; Customer)
            {
                DataItemLink = "No." = field("Client No.");


                column(CustomerName; "Post Code")
                {

                }
            }

            dataitem("Auto Rent Line"; "Auto Rent Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Price; Price)
                {

                }
                column("Sum"; "Sum")
                {

                }
                column(Main_Line; "Main Line")
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
        CustomerNameLbl = 'Customer Name';
        AdditionalLbl = 'Additional service';
        QuantityLbl = 'Quantity';
        PriceLbl = 'Price';
        SumLbl = 'Sum';
        AmountLbl = 'Amount';
        MainLineLbl = 'Main Line';
    }



    var
        myInt: Integer;
        ReportDate: Date;

}