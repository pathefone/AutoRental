table 50103 "Auto Model"
{
    Caption = 'Auto Model';
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(10; "Auto Mark Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Auto Mark";
            Caption = 'Auto Mark Code';

        }
        field(11; "Description"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; "Code", "Auto Mark Code")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;


}