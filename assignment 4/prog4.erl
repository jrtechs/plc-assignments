%%%-------------------------------------------------------------------
%%% @author Jeffery Russell
%%% @doc
%%%
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

spawn_client(N) ->
  io:fwrite("Spawned all clients\n").



% start with random account balance between 2k-3k
% receives message {clientid, number}
% negatives removes from bank, positives add
% returns {<client_id>, balance}
bank() ->
  Balance = rand:uniform(2000) + 999,
  io:format("Bank balance starting at: ~w~n", [Balance]),
  Client_count = rand:uniform(8) + 1,
  Client_left = 0,
  spawn_client(Client_count),
  loop(Balance, Client_count, Client_left).


loop(Balance, Client_count, Client_left) ->
  receive
    %io:format("Bank now has ~w", [balance])
    {CLIENT_ID, balance} ->
      io:fwrite("Requested Balance from ~w\n", [CLIENT_ID]),
      CLIENT_ID ! {Balance},
      loop(Balance, Client_count, Client_left);
    {CLIENT_ID, NUMBER} ->
      if
        Balance + NUMBER >= 0 ->
          CLIENT_ID ! {NUMBER, Balance, yes},
          loop(Balance + NUMBER, Client_count, Client_left);
        true ->
          CLIENT_ID ! {NUMBER, Balance, no},
          loop(Balance, Client_count, Client_left)
      end;
    {goodbye} ->
      if
        Client_left == Client_count ->
          io:fwrite("Client leaving\n");
        true ->
          loop(Balance, Client_count + 1, Client_left)
      end
  end.


client() ->
%%  Count = 0,
  bank_pid ! {self(), balance},
  receive
    {Balance} ->
      io:format("Bank has a balance of: ~w~n", [Balance])
  end,
  io:fwrite("Client created\n").


start() ->
  register(bank_pid, spawn(prog4, bank, [])),



  io:fwrite("hello world").

