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
-export([start/0, bank/0]).

% start with random account balance between 2k-3k
% receives message {clientid, number}
% negatives removes from bank, positives add
% returns {<client_id>, balance}
bank() ->
  Balance = rand:uniform(2000) + 1000,
  io:format("Bank balance starting at: ~w", [Balance]),
  receive
    {CLIENT_ID, NUMBER} ->
      io:format("Bank now has ~w", [balance])
  end.



start() ->
  register(bank_pid, spawn(prog4, bank, [])),
  io:fwrite("hello world").

