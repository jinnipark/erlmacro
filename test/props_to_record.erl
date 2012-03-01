%% Author: Sungjin Park
%% Created: Mar 1, 2012
%% Description: Shows how to use PROPS_TO_RECORD macro.
-module(props_to_record).
-author("Sungjin Park <jinni.park@gmail.com>").

%%
%% Include files
%%
-include("props_to_record.hrl").

-record(person, {name="Judge Holden",
				 sex=male,
				 age}).
%%
%% Exported Functions
%%
-export([showme/1]).

%%
%% API Functions
%%
showme(Props) ->
	?PROPS_TO_RECORD(Props, person).

%%
%% Local Functions
%%

%%
%% Tests
%%
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

basic_test() ->
	Person = ?PROPS_TO_RECORD([{name, "Juliet Capulet"}, {sex, female}, {age, 14}], person),
	[?assertEqual(Person#person.name, "Juliet Capulet"),
	 ?assertEqual(Person#person.sex, female),
	 ?assertEqual(Person#person.age, 14)].

default_test() ->
	Person = ?PROPS_TO_RECORD([], person),
	[?assertEqual(Person#person.name, "Judge Holden"),
	 ?assertEqual(Person#person.sex, male),
	 ?assertEqual(Person#person.age, undefined)].

ignore_test() ->
	Person = ?PROPS_TO_RECORD([{address, "Earth"}], person),
	[?assertEqual(Person#person.name, "Judge Holden"),
	 ?assertEqual(Person#person.sex, male),
	 ?assertEqual(Person#person.age, undefined)].

-endif.
