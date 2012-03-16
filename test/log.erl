%% Author: jinni
%% Created: Mar 1, 2012
%% Description: Shows how to use log macros.
-module(log).
-author("Sungjin Park, <jinni.park@gmail.com>").

%%
%% Include files
%%
-include("log.hrl").

%%
%% Exported Functions
%%
-export([showme/0]).

%%
%% API Functions
%%
showme() ->
	A = "This is a debug log.",
	?DEBUG(A),
	false = ?TRACE(A =:= "This is a trace log."),
	?INFO("This is an info log."),
	?WARNING("This is a warning log."),
	?ERROR("This is an error log.").

%%
%% Local Functions
%%
