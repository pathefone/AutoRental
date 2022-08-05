table 50107 "Auto Rent Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            TableRelation = "No. Series";
            Editable = false;
        }
        field(10; "Client No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Client No.';
            TableRelation = Customer;

            trigger OnValidate()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
                Customer: Record "Customer";
                Debt: Decimal;
                BlockedLbl: Label 'Customer is blocked!';
                DebtLbl: Label 'Customer has debt!';
            begin
                if CustLedgerEntry.Get("Client No.") then begin
                    Debt := CustLedgerEntry.Amount;
                    if Debt > 0 then
                        Error(DebtLbl);
                end;

                if Customer.Get("Client No.") then begin
                    if Customer.Blocked = Customer.Blocked::All then
                        Error(BlockedLbl);
                end;
            end;
        }
        field(11; "Driver License"; Blob)
        {
            DataClassification = SystemMetadata;
            Caption = 'Driver License';
            SubType = Bitmap;
        }
        field(12; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
        }
        field(13; "Auto No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            TableRelation = Auto;

            trigger OnValidate()
            begin
                GetRentalPrice();
                AutoValidation();
            end;
        }
        field(14; "Reservation From"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation From';

            trigger OnValidate()
            begin
                ReservationValidation(ValidationType::"Reservation From");
            end;
        }
        field(15; "Reservation To"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation To';

            trigger OnValidate()
            begin
                ReservationValidation(ValidationType::"Reservation To");
            end;
        }
        field(16; "Sum"; Decimal)
        {
            Caption = 'Sum';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Auto Rent Line"."Sum" where("Document No." = field("No.")));
        }
        field(17; "Status"; Enum "Auto Rent Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            Editable = false;
        }
        field(18; "Rent Contract Warehouse"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Rent Contract Warehouse';
            TableRelation = Location;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }



    //create codeunit for no series generation?
    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagament: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            AutoSetup.Get();
            "No." := NoSeriesManagament.GetNextNo(AutoSetup."Rental Card Nos", WorkDate(), true);
        end;
    end;


    local procedure GetRentalPrice() //problem here, create new record and the sum does not update until you open card?
    var
        Auto: Record Auto;
    begin
        if Auto.Get(Rec."Auto No.") then begin
            Auto.CalcFields("Rental Price");
            Rec."Sum" := Auto."Rental Price";
            //Rec.Modify();
        end;
    end;

    local procedure ReservationValidation(ValidationType: Enum "Validation Type")
    begin
        AutoReservation.Reset();
        AutoReservation.SetRange("Auto No.", Rec."Auto No.");
        AutoReservation.SetRange("Client No.", Rec."Client No.");

        if (ValidationType = ValidationType::"Reservation From") then
            AutoReservation.SetRange("Reservation From", Rec."Reservation From")
        else
            if (ValidationType = ValidationType::"Reservation To") then
                AutoReservation.SetRange("Reservation To", Rec."Reservation To");

        if not AutoReservation.FindSet() then
            Error(ReservationErrLbl);
    end;

    local procedure AutoValidation()
    begin
        AutoReservation.Reset();
        AutoReservation.SetRange("Auto No.", Rec."Auto No.");
        AutoReservation.SetRange("Client No.", Rec."Client No.");
        if not AutoReservation.FindSet() then
            Error(AutoErrLbl);
    end;


    var
        ReservationErrLbl: Label 'Reservation with this date does not exist!';
        AutoErrLbl: Label 'Wrong auto selected';
        AutoReservation: Record "Auto Reservation";
        ValidationType: Enum "Validation Type";


}