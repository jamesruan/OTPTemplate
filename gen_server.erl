-module(my_module_name).
-behaviour(gen_server).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0]).

%% ------------------------------------------------------------------
%% gen_server Call Back Function Exports
%%
%% gen_server module                  Callback module
%% -----------------                  ---------------
%% gen_server:start/3,4
%% gen_server:start_link/3,4   -----> Module:init/1
%%
%% gen_server:stop/1,3         -----> Module:terminate/2
%%
%% gen_server:call/2,3
%% gen_server:multi_call/2,3,4 -----> Module:handle_call/3
%%
%% gen_server:cast/2
%% gen_server:abcast/2,3       -----> Module:handle_cast/2
%%
%% -                           -----> Module:handle_info/2
%%
%% -                           -----> Module:terminate/2
%%
%% -                           -----> Module:code_change/3
%%
%% ------------------------------------------------------------------

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%% ------------------------------------------------------------------
%% API Function Definition
%% ------------------------------------------------------------------
start_link() ->
	gen_server:start_link(?MODULE, [], []).

%% ------------------------------------------------------------------
%% gen_server Call Back Function Definitions
%% ------------------------------------------------------------------

%% Handle initiation states
-spec init(Args::term()) ->
	  {ok, State::term()}
	| {ok, State::term(), Timeout::integer() | infinity }
	| {ok, State::term(), hibernate}
	| {stop, Reason::term()}
	| ignore.
init(Args) ->
	ignore.
	
%% Handle synchronous call
-spec handle_call(Request::term(), From::{pid(), Tag::atom()}, State::term()) ->
	  {reply, Reply::term(), NewState::term()}
	| {reply, Reply::term(), NewState::term(), Timeout::integer() | infinity }
	| {reply, Reply::term(), NewState::term(), hibernate}
	| {noreply, NewState::term()}
	| {noreply, NewState::term(), Timeout::integer() | infinity }
	| {noreply, NewState::term(), hibernate}
	| {stop, Reason::term(), Reply::term(), NewState::term()}
	| {stop, Reason::term(), NewState::term()}.
handle_call(Request, From, State) ->
	{reply, reply, newstate}.

%% Handle asynchronous cast
-spec handle_cast(Request::term(), State::term()) ->
	  {noreply, NewState::term()}
	| {noreply, NewState::term(), Timeout::integer() | infinity }
	| {noreply, NewState::term(), hibernate}
	| {stop, Reason::term(), NewState::term()}.
handle_cast(Request, State) ->
	{noreply, newstate}.

%% Handle (a)synchronous system message and timeout
-spec handle_info(Info::timeout | term(), State::term()) ->
	  {noreply, NewState::term()}
	| {noreply, NewState::term(), Timeout::integer() | infinity }
	| {noreply, NewState::term(), hibernate}
	| {stop, Reason::normal | term(), NewState::term()}.
handle_info(Info, State) ->
	{noreply, newstate}.

%% Undo initiation
-spec terminate(Reason::normal | shutdown | {shutdown, term()} | term(), State::term()) -> ok.
terminate(Reason, State) ->
	ok.

%% State change when code changes
-spec code_change(OldVsn::term() | {down, term()}, State::term(), Extra::term()) ->
	  {ok, NewState::term()}
	| {error, Reason::term()}.
code_change(OldVsn, State, Extra) ->
	{ok, State}.

