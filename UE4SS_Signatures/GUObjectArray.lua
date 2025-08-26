function Register()
    -- MGS Delta (UE 5.3) GUObjectArray signature
    -- This pattern looks for a common instruction sequence that accesses the global object array
    return "48 8D 0D ? ? ? ? E8 ? ? ? ? E8 ? ? ? ? E8 ? ? ? ? C6 05 ? ? ? ? 01"
end

function OnMatchFound(MatchAddress)
    -- Calculate the address from the LEA instruction
    local LeaInstr = MatchAddress
    local NextInstr = LeaInstr + 0x7  -- Size of LEA instruction
    local Offset = LeaInstr + 0x3     -- Offset location in instruction
    local AddressLoaded = NextInstr + DerefToInt32(Offset) - 0x10
    
    return AddressLoaded
end
