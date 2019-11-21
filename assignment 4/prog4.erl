%%%-------------------------------------------------------------------
%%% @author Jeffery Russell
%%% @doc
%%% PLC assignment 4
%%% @end
%%% Created : 16. Nov 2019 5:40 PM
%%%-------------------------------------------------------------------
-module(prog4).
-author("jeff").

%% API
-export([start/0, bank/0, client/0]).


spawn_client(N) when N > 1 ->
  io:fwrite("Spawning a client\n"),
  spawn(prog4, client, []),
  spawn_client(N -1);

spawn_client(_) ->
  io:fwrite("Spawned all clients\n").



% start with random account balance between 2k-3k
% receives message {clientid, number}
% negatives removes from bank, positives add
% returns {<client_id>, balance}
bank() ->
  Balance = rand:uniform(2000) + 999,
  io:format("Bank balance starting at: ~w~n", [Balance]),
  Client_count = rand:uniform(8) + 1,
  Client_left = 2,
  spawn_client(Client_count),
  loop(Balance, Client_count, Client_left).


loop(Balance, Client_count, Client_left) ->
  receive
    %io:format("Bank now has ~w", [balance])
    {CLIENT_ID, balance} ->
      io:fwrite("~w Requested Balance from the bank\n", [CLIENT_ID]),
      CLIENT_ID ! {Balance},
      loop(Balance, Client_count, Client_left);
    {CLIENT_ID, NUMBER} ->
      if
        Balance + NUMBER >= 0 ->
          CLIENT_ID ! {NUMBER, Balance + NUMBER, successful},
          loop(Balance + NUMBER, Client_count, Client_left);
        true ->
          CLIENT_ID ! {NUMBER, Balance, failed},
          loop(Balance, Client_count, Client_left)
      end;
    goodbye ->
      if
        Client_left == Client_count ->
          io:format("Bank is closing with balance ~w`\n", [Balance]);
        true ->
          loop(Balance, Client_count, Client_left + 1)
      end
  end.



client_fetch_balance() ->
  bank_pid ! {self(), balance},
  receive
    {Balance} ->
      io:format("~w recieved the balance of ~w from the bank~n", [self(), Balance])
  end.


client_loop(LoopUntil, CurrentIndex) ->

  if
    CurrentIndex rem 5 == 0 ->
      client_fetch_balance();
    true -> pass
  end,

  if
    LoopUntil == CurrentIndex ->
      bank_pid ! goodbye,
      io:format("~w Client Finished\n", [self()]);
    true ->
      bank_pid ! {self(), 100-rand:uniform(199) },

      receive
        {Amount, Balance, Suc} ->
          io:format("~w recieved the balance of ~w from the bank after a ~w transation request of ~w~n", [self(), Balance, Suc, Amount])
      end,
      client_loop(LoopUntil, CurrentIndex + 1)
  end.


client() ->
  Nums = rand:uniform(10) + 9,
  client_loop(Nums, 0).


start() ->
  register(bank_pid, spawn(prog4, bank, [])).