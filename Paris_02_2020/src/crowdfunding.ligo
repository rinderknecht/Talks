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
    if Tezos.now > store.deadline then
      failwith ("Deadline passed.")
    else case store.backers[sender] of
           None -> store.backers[sender] := Tezos.amount
         | Some (x) -> skip
         end
  end with ((nil : list (operation)), store)

function claim (var action : unit; var store : storage) : return is
  begin
    var op : list (operation) := nil;
    if Tezos.now <= store.deadline then
      failwith ("Too early.")
    else
      case store.backers[sender] of
        None -> failwith ("Not a backer.")
      | Some (asset) ->
          if Tezos.balance >= store.goal or store.funded then
            failwith ("Goal reached: no refund.")
          else {
            const dest : contract (unit) = get_contract (sender);
            op := list [Tezos.transaction (Unit, asset, dest)];
            remove sender from map store.backers
          }
      end
  end with (op, store)

function withdraw (var action : unit; var store : storage) : return is
  begin
    var op : list (operation) := nil;
    if Tezos.sender = store.owner then
     if Tezos.now >= store.deadline then
        if Tezos.balance >= store.goal then
          begin
            const dest : contract (unit) = get_contract (Tezos.sender);
            store.funded := True;
            op := list [Tezos.transaction (Unit, balance, dest)]
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
