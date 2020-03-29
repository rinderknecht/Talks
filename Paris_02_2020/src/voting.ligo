type storage is map (string, nat)
type return is list (operation) * storage

function vote (const ballot : string; var store : storage) : return is
  begin
    if   amount <= 5000mutez
    then failwith ("Insufficient fee.")
    else case store[ballot] of
                     None -> failwith ("Unknown candidate.")
         | Some (current) -> store[ballot] := current + 1n
         end
  end with ((nil : list (operation)), store)
