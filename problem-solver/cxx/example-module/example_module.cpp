/*
* This source file is part of an OSTIS project. For the latest info, see http://ostis.net
* Distributed under the MIT License
* (See accompanying file COPYING.MIT or copy at http://opensource.org/licenses/MIT)
*/

#include "example_module.hpp"

#include "agents/subdividing_search_agent.hpp"
#include "agents/isomorphic_search_agent.hpp"

SC_MODULE_REGISTER(ExampleModule)
->Agent<SubdividingSearchAgent>()
->Agent<IsomorphicSearchAgent>(); 
