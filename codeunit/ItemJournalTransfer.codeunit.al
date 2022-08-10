codeunit 50102 "Item Journal Transfer"
{
    local procedure GetNextItemJDocumentNo(): Code[20]
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagament: Codeunit NoSeriesManagement;
        ItemJournal: Record "Item Journal Line";
    begin
        AutoSetup.Get();
        exit(NoSeriesManagament.GetNextNo(AutoSetup."Item Transfer No.", WorkDate(), true));
    end;


    local procedure GetNextItemJournalNo(JournalBatchName: Code[10]; JournalTemplateName: Code[10]): Integer
    var
        ItemJournalLine: Record "Item Journal Line";
    begin
        ItemJournalLine.SetRange(ItemJournalLine."Journal Batch Name", JournalBatchName);
        ItemJournalLine.SetRange(ItemJournalLine."Journal Template Name", JournalTemplateName);

        if not ItemJournalLine.FindLast() then
            ItemJournalLine.Init();

        exit(ItemJournalLine."Line No." + 10000); 
    end;

    procedure TransferItem(AutoRentHeader: Record "Auto Rent Header"; LocationCode: Code[10]; NewLocationCode: Code[10])
    var
        AutoRentLine: Record "Auto Rent Line";
        Item: Record Item;
        ItemJournal: Record "Item Journal Line";
    begin
        AutoRentLine.SetRange("Document No.", AutoRentHeader."No.");

        if AutoRentLine.FindSet() then
            repeat
                if (AutoRentLine."Type" = AutoRentLine."Type"::Item) then begin
                    Item.Get(AutoRentLine."No.");
                    ItemJournal."Document No." := GetNextItemJDocumentNo();
                    ItemJournal."Posting Date" := System.Today();
                    ItemJournal.Description := AutoRentLine.Description;
                    ItemJournal.Quantity := AutoRentLine.Quantity;
                    ItemJournal."Item No." := Item."No.";
                    ItemJournal."Line No." := GetNextItemJournalNo('DEFAULT', 'RECLASS');
                    ItemJournal."Location Code" := LocationCode;
                    ItemJournal."New Location Code" := NewLocationCode;
                    ItemJournal."Journal Batch Name" := 'DEFAULT';
                    ItemJournal."Journal Template Name" := 'RECLASS';
                    ItemJournal.Insert();
                end;
            until AutoRentLine.Next() = 0;
    end;
}