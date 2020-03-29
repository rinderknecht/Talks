type parameter = Back | Claim | Withdraw

type storage = {
  owner    : address;
  goal     : tez;
  deadline : timestamp;
  backers  : (address, tez) map;
  funded   : bool
}

type return = operation list * storage

let back (param, store : unit * storage) : return =
  let no_op : operation list = [] in
  if Current.time > store.deadline then
    (failwith "Deadline passed." : return)
  else
    match Map.find_opt sender store.backers with
      None ->
        let backers = Map.update sender (Some amount) store.backers
        in no_op, {store with backers=backers}
    | Some (x) -> no_op, store

(*
function claim (var param : unit; var store : store) : return is
  begin
    var operations : list (operation) := nil;
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
               operations := list transaction (unit, sender, asset) end;
              remove sender from map store.backers
            end
      end
  end with (operations, store)

function withdraw (var param : unit; var store : store) : return is
  begin
    var operations : list (operation) := nil;
    if sender = owner then
      if now >= store.deadline then
        if balance >= store.goal then
          begin
             store.funded := True;
             operations := list Transfer (owner, balance) end
          end
        else failwith ("Below target.")
      else failwith ("Too early.")
    else skip
  end with (operations, store)
*)
