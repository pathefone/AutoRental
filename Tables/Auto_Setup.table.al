table 50104 "Auto Setup"
{
    Caption = 'Auto Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(10; "Auto Nos"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto Nos';
            TableRelation = "No. Series";
        }
        field(11; "Rental Card Nos"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Rental Card Nos';
            TableRelation = "No. Series";
        }
        field(12; Attachment; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Attachment';
            TableRelation = Location;
        }
        field(13; "Item Transfer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Transfer No.';
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure InsertIfNotExists()
    var
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;


}