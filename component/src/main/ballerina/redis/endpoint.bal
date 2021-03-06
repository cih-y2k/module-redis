// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Represents Redis client endpoint.
public type Client client object {
    private ClientEndpointConfiguration clientEndpointConfig;

    # Gets called when the endpoint is being initialized during the module initialization.
    public function __init(ClientEndpointConfiguration config) {
        initClient(self, config);
    }

    // String operations
    # Append a value to a key.
    #
    # + key - The key
    # + value - The string value to be appended
    # + return - Length of the string after the operation or `error` if an error occurs
    public remote extern function append(string key, string value) returns (int|error);

    # Count set bits in a string.
    #
    # + key - The key
    # + return - The number of bits set to 1 or `error` if an error occurs
    public remote extern function bitCount(string key) returns (int|error);

    # Perform bitwise AND between strings.
    #
    # + destination - Result key of the operation
    # + keys - Input keys to perform AND between
    # + return - The size of the string stored in the destination key, that is equal to the size of the longest input
    #            string or `error` if an error occurs
    public remote extern function bitOpAnd(string destination, string[] keys) returns (int|error);

    # Perform bitwise OR between strings.
    #
    # + destination - Result key of the operation
    # + keys - Input keys to perform AND between
    # + return - The size of the string stored in the destination key, that is equal to the size of the longest input
    #            string or `error` if an error occurs
    public remote extern function bitOpOr(string destination, string[] keys) returns (int|error);

    # Perform bitwise NOT on a string.
    #
    # + destination - Result key of the operation
    # + key - Input keys to perform AND between
    # + return - The size of the string stored in the destination key or `error` if an error occurs
    public remote extern function bitOpNot(string destination, string key) returns (int|error);

    # Perform bitwise XOR between strings.
    #
    # + destination - Result key of the operation
    # + key - Input keys to perform AND between
    # + return - The size of the string stored in the destination key, that is equal to the size of the longest input
    #            string or `error` if an error occurs
    public remote extern function bitOpXor(string destination, string[] key) returns (int|error);

    # Decrement the integer value of a key by one.
    #
    # + key - The key
    # + return - The value of the key after the decrement or `error` if an error occurs
    public remote extern function decr(string key) returns (int|error);

    # Decrement the integer value of a key by the given number.
    #
    # + key - The key
    # + value - The value to be decremented
    # + return - The value of the key after the decrement or `error` if an error occurs
    public remote extern function decrBy(string key, int value) returns (int|error);

    # Returns the bit value at offset in the string value stored at key.
    #
    # + key - The key
    # + offset - The offset
    # + return - The bit value stored at offset or `error` if an error occurs
    public remote extern function getBit(string key, int offset) returns (int|error);

    # Get a substring of the string stored at a key.
    #
    # + key - The key
    # + startPos - The starting point of the substring
    # + end - The end point of the substring
    # + return - The substring or `error` if an error occurs
    public remote extern function getRange(string key, int startPos, int end) returns (string|error);

    # Set the string value of a key and return its old value.
    #
    # + key - The key
    # + value - The value to be set
    # + return - The old value stored at key, or nil when key does not exist or `error` if an error occurs
    public remote extern function getSet(string key, string value) returns (string?|error);

    # Get the value of a key.
    #
    # + key - The key
    # + return - The value of the key, or nil when key does not exist or `error` if an error occurs
    public remote extern function get(string key) returns (string?|error);

    # Increment the integer value of a key by one.
    #
    # + key - The key
    # + return - The value of the key after increment or `error` if an error occurs
    public remote extern function incr(string key) returns (int|error);

    # Increment the integer value of a key by the given amount.
    #
    # + key - The key
    # + value - The amount to increment
    # + return - The value of the key after increment or `error` if an error occurs
    public remote extern function incrBy(string key, int value) returns (int|error);

    # Increment the integer value of a key by the given amount.
    #
    # + key - The key
    # + value - The amount to increment
    # + return - The value of the key after increment or `error` if an error occurs
    public remote extern function incrByFloat(string key, float value) returns (float|error);

    # Get the values of all the given keys.
    #
    # + keys - The keys of which the values need to be retrieved
    # + return - Array of values at the specified keys or `error` if an error occurs
    public remote extern function mGet(string[] keys) returns (string[]|error);

    # Set multiple keys to multiple values.
    #
    # + keyValueMap - A map of key-value pairs to be set
    # + return - A string with the value `OK` if the operation was successful or `error` if an error occurs
    public remote extern function mSet(map<any> keyValueMap) returns (string|error);

    # Set multiple keys to multiple values, only if none of the keys exist.
    #
    # + keyValueMap - A map of key-value pairs to be set
    # + return - A string with the value `OK` if the operation was successful or `error` if an error occurs
    public remote extern function mSetNx(map<any> keyValueMap) returns (boolean|error);

    # Set the value and expiration in milliseconds of a key.
    #
    # + key - The key
    # + value - The value to be set
    # + expirationTime - Expiration time in milli seconds
    # + return - New value of the key or `error` if an error occurs
    public remote extern function pSetEx(string key, string value, int expirationTime) returns (string|error);

    # Sets or clears the bit at offset in the string value stored at key.
    #
    # + key - The key
    # + value - The value to be set
    # + offset - The offset at which the value should be set
    # + return - The original bit value stored at offset or `error` if an error occurs
    public remote extern function setBit(string key, int value, int offset) returns (int|error);

    # Set the value and expiration of a key.
    #
    # + key - The key
    # + value - The value to be set
    # + expirationPeriodSeconds - Expiration time to be set, in seconds
    # + return - New value of the key or `error` if an error occurs
    public remote extern function setEx(string key, string value, int expirationPeriodSeconds) returns (string|error);

    # Set the value of a key, only if the key does not exist.
    #
    # + key - The key
    # + value - The value to be set
    # + return - New value of the key or `error` if an error occurs
    public remote extern function setNx(string key, string value) returns (boolean|error);

    # Overwrite part of a string at key starting at the specified offset.
    #
    # + key - The key
    # + offset - The offset at which the value should be set
    # + value - The value to be set
    # + return - The length of the string after it was modified or `error` if an error occurs
    public remote extern function setRange(string key, int offset, string value) returns (int|error);

    # Get the length of the value stored in a key.
    #
    # + key - The key
    # + return - The length of the string at key, or 0 when key does not exist or `error` if an error occurs
    public remote extern function strln(string key) returns (int|error);

    # Set the value of a key.
    #
    # + key - The key
    # + value - The value to be set
    # + return - A string with the value `OK` if the operation was successful or `error` if an error occurs
    public remote extern function setVal(string key, string value) returns (string|error);

    //list operations

    # Prepend one or multiple values to a list.
    #
    # + key - The key
    # + values - The values to be prepended
    # + return - The length of the list after the push operation(s) or `error` if an error occurs
    public remote extern function lPush(string key, string[] values) returns (int|error);

    # Remove and get the first element in a list.
    #
    # + key - The key
    # + return - The value of the first element, or nil when key does not exist or `error` if an error occurs
    public remote extern function lPop(string key) returns (string?|error);

    # Prepend one or multiple values to a list, only if the list exists.
    #
    # + key - The key
    # + values - The values to be prepended
    # + return - The length of the list after the push operation(s) or `error` if an error occurs
    public remote extern function lPushX(string key, string[] values) returns (int|error);

    # Remove and get the first element in a list, or block until one is available.
    #
    # + timeOut - The timeout in seconds
    # + keys - The keys
    # + return - `nil` when no element could be popped and the timeout expired. A map containing one item, with the
    #         key being  the name of the key where an element was popped and the second element  being the value of the
    #         popped element, or `error` if an error occurs
    public remote extern function bLPop(int timeOut, string[] keys) returns (map<any>?|error);

    # Remove and get the last element in a list, or block until one is available.
    #
    # + timeOut - The timeout in seconds
    # + keys - The keys
    # + return - `nil` when no element could be popped and the timeout expired. A map containing one item, with the
    #         key being  the name of the key where an element was popped and the second element being the value of the
    #         popped element, or `error` if an error occurs
    public remote extern function bRPop(int timeOut, string[] keys) returns (map<any>?|error);

    # Get an element from a list by its index.
    #
    # + key - The key
    # + index - The index from which the element should be retrieved
    # + return - The value at the given index or `error` if an error occurs
    public remote extern function lIndex(string key, int index) returns (string|error);

    # Insert an element before or after another element in a list.
    #
    # + key - The key
    # + before - boolean value representing Whether element should be inserted before or after the pivot
    # + pivot - The pivot
    # + value - The value
    # + return - The length of the list after the insert operation, or -1 when the value pivot not found, or `error` if
    #           an error occurs
    public remote extern function lInsert(string key, boolean before, string pivot, string value) returns (int|error);

    # Get the length of a list.
    #
    # + key - The key
    # + return - The length of the list at key or `error` if an error occurs
    public remote extern function lLen(string key) returns (int|error);

    # Get a range of elements from a list.
    #
    # + key - The key
    # + startPos - The begining index of the range
    # + stopPos - The last index of the range
    # + return - Array of elements in the specified range or `error` if an error occurs
    public remote extern function lRange(string key, int startPos, int stopPos) returns (string[]|error);

    # Remove elements from a list.
    #
    # + key - The key
    # + count - The number of elements to be removed
    # + value - The value which the elements to be removed should be equal to
    # + return - Number of elements removed or `error` if an error occurs
    public remote extern function lRem(string key, int count, string value) returns (int|error);

    # Set the value of an element in a list by its index.
    #
    # + key - The key of the list
    # + index - The index of the element of which the value needs to be set
    # + value - The value to be set
    # + return - A string with the value `OK` if the operation was successful or `error` if an error occurs
    public remote extern function lSet(string key, int index, string value) returns (string|error);

    # Trim a list to the specified range.
    #
    # + key - The key of the list
    # + startPos - The starting index of the range
    # + stopPos - The end index of the range
    # + return - A string with the value `OK` if the operation was successful or `error` if an error occurs
    public remote extern function lTrim(string key, int startPos, int stopPos) returns (string|error);

    # Remove and get the last element in a list.
    #
    # + key - The key of the list
    # + return - The value of the last element, or `nil` when key does not exist or `error` if an error occurs
    public remote extern function rPop(string key) returns (string?|error);

    # Remove the last element in a list, append it to another list and return it.
    #
    # + source - The source key
    # + destination - The destination key
    # + return - The element being popped and pushed or `error` if an error occurs
    public remote extern function rPopLPush(string source, string destination) returns (string|error);

    # Append one or multiple values to a list.
    #
    # + key - The key of the list
    # + values - Array of values to be appended
    # + return - The length of the list after the push operation or `error` if an error occurs
    public remote extern function rPush(string key, string[] values) returns (int|error);

    # Append one or multiple values to a list, only if the list exists.
    #
    # + key - The key of the list
    # + values - Array of values to be appended
    # + return - The length of the list after the push operation or `error` if an error occurs
    public remote extern function rPushX(string key, string[] values) returns (int|error);

    // Set Commands
    # Add one or more members to a set.
    #
    # + key - The key of the set
    # + values - Array of values to be added
    # + return - The number of elements that were added to the set, not including all the elements which were
    #            already present in the set, or `error` if an error occurs
    public remote extern function sAdd(string key, string[] values) returns (int|error);

    # Get the number of members in a set
    #
    # + key - The key of the set
    # + return - The cardinality (number of elements) of the set or `error` if an error occurs
    public remote extern function sCard(string key) returns (int|error);

    # Return set resulting from the difference between the first set and all the successive sets
    #
    # + keys - The keys of the sets
    # + return - An array of members of the resulting set or `error` if an error occurs
    public remote extern function sDiff(string[] keys) returns (string[]|error);

    # Obtain the set resulting from the difference between the first set and all the successive.
    # sets and store at the provided destination.
    #
    # + destination - The destination key of the resulting set
    # + keys - The keys of the sets to find the difference of
    # + return - The number of members in the resulting set or `error` if an error occurs
    public remote extern function sDiffStore(string destination, string[] keys) returns (int|error);

    # Return the intersection of the provided sets.
    #
    # + keys - The keys of the sets to be intersected
    # + return - An array of members of the resulting set or `error` if an error occurs
    public remote extern function sInter(string[] keys) returns (string[]|error);

    # Obtain the intersection of the provided sets and store at the provided destination.
    #
    # + destination - The destination key of the resulting set
    # + keys - The keys of the sets to be intersected
    # + return - An array of members of the resulting set or `error` if an error occurs
    public remote extern function sInterStore(string destination, string[] keys) returns (int|error);

    # Determine if a given value is a member of a set.
    #
    # + key - The key of the set
    # + value - The value
    # + return - boolean true/false depending on whether the value is a member of the set or not, or `error` if an error
    #            occurs
    public remote extern function sIsMember(string key, string value) returns (boolean|error);

    # Get all the members in a set.
    #
    # + key - The key of the set
    # + return - Array of all members in the set or `error` if an error occurs
    public remote extern function sMembers(string key) returns (string[]|error);

    # Move a member from one set to another.
    #
    # + source - The source key
    # + destination - The destination key
    # + member - The member to be moved
    # + return - `true` if the element is moved. `false` if the element is not a member of source and no
    #             operation was performed or `error` if an error occurs
    public remote extern function sMove(string source, string destination, string member) returns (boolean|error);


    # Remove and return a random member from a set.
    #
    # + key - The source key
    # + count - Number of members to pop
    # + return - Array of removed elements or `nil` if key does not exist or `error` if an error occurs
    public remote extern function sPop(string key, int count) returns (string[]?|error);

    # Get one or multiple random members from a set.
    #
    # + key - The key of the set
    # + count - Number of members to obtain
    # + return - Array of the randomly selected elements, or `nil` when key does not exist or `error` if an error occurs
    public remote extern function sRandMember(string key, int count) returns (string[]?|error);

    # Remove one or more members from a set.
    #
    # + key - The key of the set
    # + members - Array of members to remove
    # + return - The number of members that were removed from the set, not including non existing members or `error` if
    #            an error occurs
    public remote extern function sRem(string key, string[] members) returns (int|error);

    # Return the union of multiple sets.
    #
    # + keys - Array of keys of sets
    # + return - Array of members of the resulting set or `error` if an error occurs
    public remote extern function sUnion(string[] keys) returns (string[]|error);

    # Return the union of multiple sets.
    #
    # + destination - The destination key of the resulting set
    # + keys - Array of keys of sets
    # + return - Number of members of the resulting set or `error` if an error occurs
    public remote extern function sUnionStore(string destination, string[] keys) returns (int|error);

    //Sorted set Commands
    # Add one or more members to a sorted set, or update its score if it already exist.
    #
    # + key - The key of the sorted set
    # + memberScoreMap - A map of members and corresponding scores
    # + return - The number of elements that were added to the sorted set, not including all the elements which were
    #            already present in the set for which the score was updated, or `error` if an error occurs
    public remote extern function zAdd(string key, map<any> memberScoreMap) returns (int|error);

    # Get the number of members in a sorted set.
    #
    # + key - The key of the sorted set
    # + return - The cardinality (number of elements) of the sorted set or `error` if an error occurs
    public remote extern function zCard(string key) returns (int|error);

    # Count the members in a sorted set with scores within the given range.
    #
    # + key - The key of the sorted set
    # + min - The minimum score of the range
    # + max - The maximum score of the range
    # + return - The number of elements in the specified score range or `error` if an error occurs
    public remote extern function zCount(string key, float min, float max) returns (int|error);

    # Increment the score of a member in a sorted set.
    #
    # + key - The key of the sorted set
    # + amount - The amount to increment
    # + member - The member whose score to be incremented
    # + return - The new score of the member or `error` if an error occurs
    public remote extern function zIncrBy(string key, float amount, string member) returns (float|error);

    # Intersect multiple sorted sets and store the resulting sorted set in a new key.
    #
    # + destination - The destination key of the resulting sorted set
    # + keys - The keys of the sorted sets to be intersected
    # + return - The number of elements in the resulting sorted set or `error` if an error occurs
    public remote extern function zInterStore(string destination, string[] keys) returns (int|error);

    # Count the members in a sorted set within the given lexicographical range.
    #
    # + key - The key of the sorted set
    # + min - The minimum lexicographical value of the range
    # + max - The maximum lexicographical value of the range
    # + return - The number of elements in the specified lexicographical value range or `error` if an error occurs
    public remote extern function zLexCount(string key, string min, string max) returns (int|error);

    # Return a range of members in a sorted set, by index.
    #
    # + key - The key of the sorted set
    # + min - The minimum index of the range
    # + max - The maximum index of the range
    # + return - The range of members in a sorted set, by index, or `error` if an error occurs
    public remote extern function zRange(string key, int min, int max) returns (string[]|error);

    # Return a range of members in a sorted set, by lexicographical range from lowest to highest.
    #
    # + key - The key of the sorted set
    # + min - The minimum lexicographical value of the range
    # + max - The maximum lexicographical value of the range
    # + return - Array of members in the specified lexicographical value range ordered from lowest to highest or `error`
    #            if an error occurs
    public remote extern function zRangeByLex(string key, string min, string max) returns (string[]|error);

    # Return a range of members in a sorted set, by lexicographical range ordered from highest to
    # lowest.
    #
    # + key - The key of the sorted set
    # + min - The lexicographical value of the range
    # + max - The maximum lexicographical value of the range
    # + return - Array of members in the specified lexicographical value range ordered from highest to lowest or `error`
    #            if an error occurs
    public remote extern function zRevRangeByLex(string key, string min, string max) returns (string[]|error);

    # Return a range of members in a sorted set, by score from lowest to highest.
    #
    # + key - The key of the sorted set
    # + min - The minimum score of the range
    # + max - The maximum score of the range
    # + return - Array of members in the specified score range ordered from lowest to highest or `error` if an error occurs
    public remote extern function zRangeByScore(string key, float min, float max) returns (string[]|error);

    # Determine the index of a member in a sorted set.
    #
    # + key - The key of the sorted set
    # + member - The member of which the index needs to be obtained
    # + return - The index of the member or `error` if an error occurs
    public remote extern function zRank(string key, string member) returns (int|error);

    # Remove one or more members from a sorted set
    #
    # + key - The key of the sorted set
    # + members - The members to be removed
    # + return - The number of members removed from the sorted set, not including non existing members or `error` if an
    #            error occurs
    public remote extern function zRem(string key, string[] members) returns (int|error);

    # Remove all members in a sorted set between the given lexicographical range.
    #
    # + key - The key of the sorted set
    # + min - The minimum lexicographical value of the range
    # + max - The maximum lexicographical value of the range
    # + return - The number of members removed from the sorted set or `error` if an error occurs
    public remote extern function zRemRangeByLex(string key, string min, string max) returns (int|error);

    # Remove all members in a sorted set within the given indices.
    #
    # + key - The key of the sorted set
    # + min - The minimum index of the range
    # + max - The maximum index of the range
    # + return - The number of members removed from the sorted set or `error` if an error occurs
    public remote extern function zRemRangeByRank(string key, int min, int max) returns (int|error);

    # Remove all members in a sorted set within the given scores.
    #
    # + key - The key of the sorted set
    # + min - The minimum score of the range
    # + max - The maximum score of the range
    # + return - The number of members removed from the sorted set or `error` if an error occurs
    public remote extern function zRemRangeByScore(string key, float min, float max) returns (int|error);

    # Return a range of members in a sorted set, by index, ordered highest to lowest.
    #
    # + key - The key of the sorted set
    # + min - The minimum index of the range
    # + max - The maximum index of the range
    # + return - The number of elements in the specified index range or `error` if an error occurs
    public remote extern function zRevRange(string key, int min, int max) returns (string[]|error);

    # Return a range of members in a sorted set, by score from highest to lowest.
    #
    # + key - The key of the sorted set
    # + min - The minimum score of the range
    # + max - The maximum score of the range
    # + return - Array of members in the specified score range ordered from highest to lowest or `error` if an error occurs
    public remote extern function zRevRangeByScore(string key, float min, float max) returns (string[]|error);

    # Determine the index of a member in a sorted set
    #
    # + key - The key of the sorted set
    # + member - The member of which the index needs to be obtained
    # + return - The index of the member or `error` if an error occurs
    public remote extern function zRevRank(string key, string member) returns (int|error);

    # Determine the score of a member in a sorted set
    #
    # + key - The key of the sorted set
    # + member - The member of which the score needs to be obtained
    # + return - The score of the member or `error` if an error occurs
    public remote extern function zScore(string key, string member) returns (float|error);

    # Return the union of multiple sorted sets
    #
    # + destination - The destination key of the resulting set
    # + keys - Array of keys of sorted sets
    # + return - Number of members of the resulting sorted set or `error` if an error occurs
    public remote extern function zUnionStore(string destination, string[] keys) returns (int|error);

    //Hash Commands

    # Delete one or more hash fields.
    #
    # + key - The key of the hash
    # + fields - Array of fields to be deleted
    # + return - Number of fields that were removed from the hash, not including specified but non existing fields or
    #            `error` if an error occurs
    public remote extern function hDel(string key, string[] fields) returns (int|error);

    # Determine if a hash field exists.
    #
    # + key - The key of the hash
    # + field - Array of fields to be deleted
    # + return - boolean `true` if the hash contains the field. boolean false if the hash does not contain
    #            field or key does not exist or `error` if an error occurs
    public remote extern function hExists(string key, string field) returns (boolean|error);

    # Get the value of a hash field.
    #
    # + key - The key of the hash
    # + field - The field
    # + return - The value of the field or `error` if an error occurs
    public remote extern function hGet(string key, string field) returns (string|error);

    # Get the all values of a hash.
    #
    # + key - The key of the hash
    # + return - Map of field-value pairs or `error` if an error occurs
    public remote extern function hGetAll(string key) returns (map<any>|error);

    # Increment the integer value of a hash field by the given number.
    #
    # + key - The key of the hash
    # + field - The field
    # + amount - The amount to increment
    # + return - The value of the field or `error` if an error occurs
    public remote extern function hIncrBy(string key, string field, int amount) returns (int|error);

    # Increment the float value of a hash field by the given number.
    #
    # + key - The key of the hash
    # + field - The field
    # + amount - The amount to increment
    # + return - The value of the field or `error` if an error occurs
    public remote extern function hIncrByFloat(string key, string field, float amount) returns (float|error);

    # Get all the fields in a hash.
    #
    # + key - The key of the hash
    # + return - Array of hash fields or `error` if an error occurs
    public remote extern function hKeys(string key) returns (string[]|error);

    # Get the number of fields in a hash.
    #
    # + key - The key of the hash
    # + return - Number of fields or `error` if an error occurs
    public remote extern function hLen(string key) returns (int|error);

    # Get the values of all the given hash fields.
    #
    # + key - The key of the hash
    # + fields - Array of hash fields
    # + return - Map of field-value pairs or `error` if an error occurs
    public remote extern function hMGet(string key, string[] fields) returns (map<any>|error);

    # Set multiple hash fields to multiple values.
    #
    # + key - The key of the hash
    # + fieldValueMap - Map of field-value pairs
    # + return - A string with the value `OK` if the operation was successful, or `error` if an error occurs
    public remote extern function hMSet(string key, map<any> fieldValueMap) returns (string|error);

    # Set the string value of a hash field.
    #
    # + key - The key of the hash
    # + field - The field
    # + value - The value to be set to the field
    # + return - boolean `true` if field is a new field in the hash and value was set. boolean false if
    #         field already exists in the hash and the value was updated, or `error` if an error occurs
    public remote extern function hSet(string key, string field, string value) returns (boolean|error);

    # Set the string value of a hash field, only if the field does not exist.
    #
    # + key - The key of the hash
    # + field - The field
    # + value - The value to be set to the field
    # + return - boolean `true` if field is a new field in the hash and value was set. boolean false if
    #            field already exists in the hash and no operation was performed, or `error` if an error occurs
    public remote extern function hSetNx(string key, string field, string value) returns (boolean|error);

    # Get the string length of the field value in a hash.
    #
    # + key - The key of the hash
    # + field - The field
    # + return - The length of the field value, or 0 when field is not present in the hash or key does
    #            not exist at all, or `error` if an error occurs
    public remote extern function hStrln(string key, string field) returns (int|error);

    # Get all the values in a hash.
    #
    # + key - The key of the hash
    # + return - Array of values in the hash, or an empty array when key does not exist or `error` if an error occurs
    public remote extern function hVals(string key) returns (string[]|error);

    //Key Commands

    # Delete one or more keys.
    #
    # + keys - The key to be deleted
    # + return - The number of keys that were removed or `error` if an error occurs
    public remote extern function del(string[] keys) returns (int|error);

    # Determine how many keys exist.
    #
    # + keys - The keys of which existence to be found out
    # + return - The number of existing keys or `error` if an error occurs
    public remote extern function exists(string[] keys) returns (int|error);

    # Set a key's time to live in seconds.
    #
    # + key - The keys of which expiry time to be set
    # + seconds - Expiry in seconds
    # + return - boolean `true` if the timeout was set. false if key does not exist or the timeout could not be set or
    # `error` if an error occurs
    public remote extern function expire(string key, int seconds) returns (boolean|error);

    # Find all keys matching the given pattern.
    #
    # + pattern - The pattern to match
    # + return - Array of keys matching the given pattern or `error` if an error occurs
    public remote extern function keys(string pattern) returns (string[]|error);

    # Move a key to another database.
    #
    # + key - The key to be moved
    # + database - The database to which the key needs to be moved
    # + return - boolean true if key was succesfully moved, boolean false otherwise or `error` if an error occurs
    public remote extern function move(string key, int database) returns (boolean|error);

    # Remove the expiration from a key.
    #
    # + key - The key of which expiry time should be removed
    # + return - boolean `true` if the timeout was removed. boolean `false` if key does not exist or does not have
    #            an associated timeout, or `error` if an error occurs
    public remote extern function persist(string key) returns (boolean|error);

    # Set a key's time to live in milliseconds..
    #
    # + key - The key of which expiry time should be removed
    # + timeMilliSeconds - The expiry time in milli seconds
    # + return - boolean `true` if the timeout was set. boolean false if key does not exist or the timeout could not
    #         be set, or `error` if an error occurs
    public remote extern function pExpire(string key, int timeMilliSeconds) returns (boolean|error);

    # Get the time to live for a key in milliseconds
    #
    # + key - The key of which time-to-live should be obtained
    # + return - time-to-live of the key, in milli seconds or `error` if an error occurs
    public remote extern function pTtl(string key) returns (int|error);

    # Return a random key from the keyspace.
    #
    # + return - The random key, or `nil` when the database is empty or `error` if an error occurs
    public remote extern function randomKey() returns (string?|error);

    # Rename a key.
    #
    # + key - The key to be renamed
    # + newName - The new name of the key
    # + return - A string with the value `OK` if the operation was successful or `error` if an error occurs
    public remote extern function rename(string key, string newName) returns (string|error);

    # Rename a key, only if the new key does not exist.
    #
    # + key - The key to be renamed
    # + newName - The new name of the key
    # + return - boolean `true` if key was renamed to newkey. boolean `false` if newkey already exists. Or `error` if an
    #            error occurs
    public remote extern function renameNx(string key, string newName) returns (boolean|error);

    # Sort the elements in a list, set or sorted set.
    #
    # + key - The key of the data typeure to be sorted
    # + return - Sorted array containing the members of the sorted data type or `error` if an error occurs
    public remote extern function sort(string key) returns (string[]|error);

    # Get the time to live for a key.
    #
    # + key - The key of which the time to live needs to be obtained
    # + return - Time to live in seconds or a negative value/`error` in order to signal an error in evaluating ttl.
    #         Whether it is a negative value of an `error` would differ depending on whether the error occurs at DB
    #         level or the driver level
    public remote extern function ttl(string key) returns (int|error);

    # Determine the type stored at key.
    #
    # + key - The key of which the type needs to be obtained
    # + return - Time to live in seconds or a negative value/`error` in order to signal an error in evaluating te type.
    #         Whether it is a negative value of an `error` would differ depending on whether the error occurs at DB
    #         level or the driver level
    public remote extern function redisType(string key) returns (string|error);

    //Connection commands

    # Authenticate to the server.
    #
    # + password - The password
    # + return - A string with the value `OK` if the operation was successful or `error` if an error occurs
    public remote extern function auth(string password) returns (string|error);

    # Echo the given string.
    #
    # + message - The message to be echo-ed
    # + return - The message itself if the operation was successful or `error` if an error occurs
    public remote extern function echo(string message) returns (string|error);

    # Ping the server.
    #
    # + return - A string with the value `PONG` if the operation was successful or `error` if an error occurs
    public remote extern function ping() returns (string|error);

    # Stops the registered service.
    public function stop() {
        close(self);
    }
};

# An internal function used by clients to shutdown the connection/connection pool(if pooling enabled).
#
# + redisClient - Client object that encapsulates the connection/connection pool
extern function close (Client redisClient);

extern function initClient(Client redisClient, ClientEndpointConfiguration clientEndpointConfig);

# The Client endpoint configuration for Redis databases.
#
# + host - The host of the Redis database
# + password - Password for the database connection
# + options - Properties for the connection configuration
public type ClientEndpointConfiguration record {
    string host = "";
    string password = "";
    Options options = {};
    !...
};

# Connection options for Redis Client Endpoint.
#
# + clientName - The clientName of the connection
# + connectionPooling - Boolean value depending on whether the connection
#   pooling is enabled or not
# + isClusterConnection - Whether to enable cluster connection or not
# + ssl - Boolean value depending on whether SSL is enabled or not
# + startTls - Boolean value depending on whether startTLS is enabled or not
# + verifyPeer - Boolean value depending on whether peer verification is
#   enabled or not
# + database - The database to be used with the connection
# + connectionTimeout - The timeout value for the connection
public type Options record {
    string clientName = "";
    boolean connectionPooling = false;
    boolean isClusterConnection = false;
    boolean ssl = false;
    boolean startTls = false;
    boolean verifyPeer = false;
    int database = -1;
    int connectionTimeout = -1;
    !...
};
