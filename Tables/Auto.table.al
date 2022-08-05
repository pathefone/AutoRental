table 50102 "Auto"
{
    Caption = 'Auto';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }
        field(10; "Auto Name"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto Name';
        }
        field(11; "Auto Mark"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto Mark';
            TableRelation = "Auto Mark";
        }
        field(12; "Auto Model"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto Model';
            TableRelation = "Auto Model" where ("Auto Mark Code" = field("Auto Mark"));
        }
        field(13; "Year of production"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Year of production';
        }
        field(14; "Civil Insurance Validity"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Validity of civil insurance';
        }
        field(15; "Tech Inspection Validity"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Validity of technical inspection';
        }
        field(16; "Location Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Location Code';
            TableRelation = Location;

        }
        field(17; "Rental Service"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Rental Service';
            TableRelation = Resource;
        }
        field(18; "Rental Price"; Decimal)
        {
            Caption = 'Rental Price';
            Editable = false;
            
            FieldClass = FlowField;
            CalcFormula = lookup(Resource."Unit Price" where("No." = field("Rental Service")));
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }



    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagament: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            AutoSetup.Get();
            "No." := NoSeriesManagament.GetNextNo(AutoSetup."Auto Nos", WorkDate(), true);
        end;

    end;


}