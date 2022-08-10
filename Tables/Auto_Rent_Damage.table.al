table 50100 "Auto Rent Damage"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Rent Damage';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            Editable = false;
        }
        field(10; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
            Editable = false;
        }
        field(11; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
        }
        field(12; "Description"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AutoRentDamage: Record "Auto Rent Damage";
    begin
        AutoRentDamage.SetRange("Document No.", Rec."Document No.");

        if not AutoRentDamage.FindLast() then
            AutoRentDamage.Init()
        else
            Rec."Line No." := AutoRentDamage."Line No." + 10000;
    end;



}