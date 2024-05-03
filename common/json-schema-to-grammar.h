#pragma once
#include <llama/json.hpp>

std::string json_schema_to_grammar(const nlohmann::ordered_json& schema);
