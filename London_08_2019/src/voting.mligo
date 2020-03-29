type storage = (string, nat) map
type return  = operation list * storage

let vote (ballot, store : string * storage) : return =
  if amount <= 5000mutez
  then (failwith "Insufficient fee." : return)
  else match Map.find_opt ballot store with
         None -> (failwith "Unknown candidate." : return)
       | Some current ->
           let store = Map.update ballot (Some (current + 1n)) store
           in ([] : operation list), store
