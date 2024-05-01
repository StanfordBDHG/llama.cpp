@llama.cpp
<<<<<<< HEAD
=======
@parallel
>>>>>>> b2776
Feature: Parallel

  Background: Server startup
    Given a server listening on localhost:8080
<<<<<<< HEAD
    And   a model file stories260K.gguf
    And   a model alias tinyllama-2
    And   42 as server seed
    And   64 KV cache size
    And   2 slots
    And   embeddings extraction
=======
    And   a model file tinyllamas/split/stories15M-00001-of-00003.gguf from HF repo ggml-org/models
    And   a model file test-model-00001-of-00003.gguf
    And   42 as server seed
    And   128 as batch size
    And   256 KV cache size
    And   2 slots
>>>>>>> b2776
    And   continuous batching
    Then  the server is starting
    Then  the server is healthy

  Scenario Outline: Multi users completion
    Given a prompt:
      """
      Write a very long story about AI.
      """
    And a prompt:
      """
      Write another very long music lyrics.
      """
    And <n_predict> max tokens to predict
    Given concurrent completion requests
    Then the server is busy
    Then the server is idle
    And  all slots are idle
    Then all prompts are predicted with <n_predict> tokens
    Examples:
      | n_predict |
      | 128       |

  Scenario Outline: Multi users OAI completions compatibility
    Given a system prompt You are a writer.
    And   a model tinyllama-2
    Given a prompt:
      """
      Write a very long book.
      """
    And a prompt:
      """
      Write another a poem.
      """
    And <n_predict> max tokens to predict
    And streaming is <streaming>
    Given concurrent OAI completions requests
    Then the server is busy
    Then the server is idle
    Then all prompts are predicted with <n_predict> tokens
    Examples:
      | streaming | n_predict |
      | disabled  | 128       |
      | enabled   | 64        |

  Scenario Outline: Multi users OAI completions compatibility no v1
    Given a system prompt You are a writer.
    And   a model tinyllama-2
    Given a prompt:
      """
      Write a very long book.
      """
    And a prompt:
      """
      Write another a poem.
      """
    And <n_predict> max tokens to predict
    And streaming is <streaming>
    Given concurrent OAI completions requests no v1
    Then the server is busy
    Then the server is idle
    Then all prompts are predicted with <n_predict> tokens
    Examples:
      | streaming | n_predict |
      | disabled  | 128       |
      | enabled   | 64        |

<<<<<<< HEAD
=======

>>>>>>> b2776
  Scenario:  Multi users with total number of tokens to predict exceeds the KV Cache size #3969
    Given a prompt:
      """
      Write a very long story about AI.
      """
    And a prompt:
      """
      Write another very long music lyrics.
      """
    And a prompt:
      """
      Write a very long poem.
      """
    And a prompt:
      """
      Write a very long joke.
      """
    And 128 max tokens to predict
    Given concurrent completion requests
    Then the server is busy
    Then the server is idle
    Then all prompts are predicted
<<<<<<< HEAD

  Scenario: Multi users embeddings
    Given a prompt:
      """
      Write a very long story about AI.
      """
    And a prompt:
      """
      Write another very long music lyrics.
      """
    And a prompt:
      """
      Write a very long poem.
      """
    And a prompt:
      """
      Write a very long joke.
      """
    Given concurrent embedding requests
    Then the server is busy
    Then the server is idle
    Then all embeddings are generated

  Scenario: Multi users OAI compatibility embeddings
    Given a prompt:
      """
      In which country Paris is located ?
      """
    And a prompt:
      """
      Is Madrid the capital of Spain ?
      """
    And a prompt:
      """
      What is the biggest US city ?
      """
    And a prompt:
      """
      What is the capital of Bulgaria ?
      """
    And   a model tinyllama-2
    Given concurrent OAI embedding requests
    Then the server is busy
    Then the server is idle
    Then all embeddings are generated
=======
>>>>>>> b2776
