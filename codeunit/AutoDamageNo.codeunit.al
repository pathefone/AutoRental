codeunit 50103 "Auto Damage No"
{
    procedure GetNextRowNo(AutoNo: Code[10]): Integer
    var
        AutoDamage: Record "Auto Damage";
    begin
        AutoDamage.SetRange("Auto No.", AutoNo);

        if not AutoDamage.FindLast() then
            AutoDamage.Init();

        exit(AutoDamage."Row No." + 1);
    end;
}