type parameter = | Back | Claim | Withdraw;

type storage = {
  owner    : address,
  goal     : tez,
  deadline : timestamp,
  backers  : map (address, tez),
  funded   : bool,
};

type return = (list (operation), storage);

let back = ((param, store) : (unit, storage)) : return => {
  let no_op : list (operation) = [];
  if (Current.time > store.deadline) {
    (failwith ("Deadline passed.") : return); }
  else {
    switch (Map.find_opt (sender, store.backers)) {
    | None => {
        let backers = Map.update (sender, Some (amount), store.backers);
        (no_op, {...store, backers:backers}) }
    | Some (x) => (no_op, store)
    }
  }
};

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
