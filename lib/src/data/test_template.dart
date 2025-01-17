/*
 * Copyright © 2020 Birju Vachhani
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/// A template for generating file author line.
String get timeStampTemplate => '/// Generated by spider on [TIME]\n\n';

/// A template for generating test files.
String get testTemplate => '''import 'dart:io';

import 'package:[TEST_IMPORT]/[TEST_IMPORT].dart';
import 'package:[PROJECT_NAME]/[PACKAGE]/[IMPORT_FILE_NAME]';

void main() {
  test('[FILE_NAME] assets test', () {
    [TESTS]
  });
}''';

/// A template for generating single test expect statement.
String get expectTestTemplate =>
    'expect(File([CLASS_NAME].[ASSET_NAME]).existsSync(), true);';

/// A template of yaml config for using in tests.
String get testYamlConfigTemplate => '''
# Generated by Spider

# Generates unit tests to verify that the assets exists in assets directory
generate_tests: true

# Use this to remove vcs noise created by the `generated` comments in dart code
no_comments: true

# Exports all the generated file as the one library
export: true

# This allows you to import all the generated references with 1 single import!
use_part_of: true

# Generates a variable that contains a list of all asset values
use_references_list: false

# Location where all the generated references will be stored
package: resources

# List of linter rules that will be ignored in generated files (except for tests)
ignored_rules: [ public_member_api_docs, member-ordering-extended, test_rule ]

groups:
  - class_name: Images
    path: assets/images
    types: [ .png, .jpg, .jpeg, .webp, .webm, .bmp ]
  
  - class_name: Svgs
    sub_groups:
      - path: assets/svgsMenu
        prefix: menu
        types: [ .svg ]

      - path: assets/svgsOther
        prefix: other
        types: [ .svg ]
  
  - class_name: Ico
    types: [ .ico ]
    prefix: ico
    sub_groups:
      - path: assets/icons
        prefix: test1
        types: [ .ttf ]

      - path: assets/vectors
        prefix: test2
        types: [ .pdf ]
  
  - class_name: Video
    types: [ .mp4 ]
    path: assets/moviesOnly
    sub_groups:
      - path: assets/movies
        prefix: common

      - path: assets/moviesExtra
        prefix: extra
#  - path: assets/vectors
#    class_name: Svgs
#    package: res
#    types: [ .svg ]
''';

/// A template of json config for using in tests.
String get testJsonConfigTemplate => '''
{
  "generate_tests":true,
  "no_comments":true,
  "export":true,
  "use_part_of":true,
  "use_references_list": false,
  "package":"resources",
  "ignored_rules": [ "public_member_api_docs", "member-ordering-extended", "test_rule" ],
  "groups": [
    {
      "class_name": "Images",
      "path": "assets/images",
      "types": [
        ".png",
        ".jpg",
        ".jpeg",
        ".webp",
        ".webm",
        ".bmp"
      ]
    },
    {
      "class_name": "Svgs",
      "sub_groups": [
        {
          "path": "assets/svgsMenu",
          "prefix": "menu",
          "types": [
            ".svg"
          ]
        },
        {
          "path": "assets/svgsOther",
          "prefix": "other",
          "types": [
            ".svg"
          ]
        }
      ]
    },
    {
      "class_name": "Ico",
      "types": [
        ".ico"
      ],
      "prefix": "ico",
      "sub_groups": [
        {
          "path": "assets/icons",
          "prefix": "test1",
          "types": [
            ".ttf"
          ]
        },
        {
          "path": "assets/vectors",
          "prefix": "test2",
          "types": [
            ".pdf"
          ]
        }
      ]
    },
    {
      "class_name": "Video",
      "types": [
        ".mp4"
      ],
      "path": "assets/moviesOnly",
      "sub_groups": [
        {
          "path": "assets/movies",
          "prefix": "common"
        },
        {
          "path": "assets/moviesExtra",
          "prefix": "extra"
        }
      ]
    }
  ]
}
''';
