%
% This file is part of AtomVM.
%
% Copyright 2024 Tomasz Sobkiewicz <tomasz.sobkiewicz@swmansion.com>
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%    http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%
% SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later
%

-module(test_prim_file_getcwd).

-export([start/0]).

start() ->
    ok = test_getcwd(),
    0.

test_getcwd() ->
    {ok, Path} = prim_file:get_cwd(),
    true = is_valid_path(Path),
    ok.

is_valid_path(<<"/", _/binary>>) ->
    true;
is_valid_path(_) ->
    false.
