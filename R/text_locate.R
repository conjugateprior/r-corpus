#  Copyright 2017 Patrick O. Perry.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.


text_count <- function(x, terms, filter = token_filter(),
                       weights = NULL, group = NULL)
{
    x <- as_text(x)
    terms <- as_character_vector("terms", terms)
    filter <- as_token_filter(filter)
    .Call(C_text_count, x, terms, filter, weights, group)
}


text_detect <- function(x, terms, filter = token_filter())
{
    x <- as_text(x)
    terms <- as_character_vector("terms", terms)
    filter <- as_token_filter(filter)
    .Call(C_text_detect, x, terms, filter)
}


text_locate <- function(x, terms, filter = token_filter())
{
    x <- as_text(x)
    nm <- names(x)
    terms <- as_character_vector("terms", terms)
    filter <- as_token_filter(filter)
    ans <- .Call(C_text_locate, x, terms, filter)
    if (!is.null(nm)) {
        ans$text <- nm[ans$text]
    }
    ans
}