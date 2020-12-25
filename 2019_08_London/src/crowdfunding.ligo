type parameter is Back | Claim | Withdraw

type storage is
  record
    owner    : address;
    goal     : tez;
    deadline : timestamp;
    backers  : map (address, tez);
    funded   : bool
  end

type return is list (operation) * storage

function back (var action : unit; var store : storage) : return is
  begin
    if now > store.deadline then
      failwith ("Deadline passed.")
    else case store.backers[sender] of
           None -> store.backers[sender] := amount
         | Some (x) -> skip
         end
  end with ((nil : list (operation)), store)

function claim (var action : unit; var store : storage) : return is
  begin
    var op : list (operation) := nil;
    if now <= store.deadline then
      failwith ("Too early.")
    else
      case store.backers[sender] of
        None -> failwith ("Not a backer.")
      | Some (asset) ->
          if balance >= store.goal or store.funded then
            failwith ("Goal reached: no refund.")
          else
            begin
              const dest : contract (unit) = get_contract (sender);
              op := list transaction (Unit, asset, dest) end;
              remove sender from map store.backers
            end
      end
  end with (op, store)

function withdraw (var parameter : unit; var store : storage) : return is
  begin
    var op : list (operation) := nil;
    if sender = store.owner then
      if now >= store.deadline then
        if balance >= store.goal then
          begin
            const dest : contract (unit) = get_contract (sender);
            store.funded := True;
            op := list transaction (Unit, balance, dest) end
          end
        else failwith ("Below target.")
      else failwith ("Too early.")
    else skip
  end with (op, store)

function main (const action : parameter; const store : storage) : return is
  case action of
    Back     -> back (Unit, store)
  | Claim    -> claim (Unit, store)
  | Withdraw -> withdraw (Unit, store)
  end
