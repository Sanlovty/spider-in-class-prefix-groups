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

import 'package:spider/src/constants.dart';

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

/// Returns config for testing with abilty to test with different parameters.
String getTestConfig({
  required bool isJson,
  bool generateTests = true,
  bool export = true,
  bool noComments = true,
  bool usePartOf = true,
  bool useReferencesList = false,

  /// TODO(Sanlovty): make ignoredRules injectable into config (not hardcoded).
  List<String>? ignoredRules = const [
    "public_member_api_docs",
    "member-ordering-extended",
    "test_rule"
  ],
  String? package = Constants.DEFAULT_PACKAGE,
  String? exportFile,
}) {
  if (isJson) {
    return '''
{
  "generate_tests": $generateTests,
  "no_comments": $noComments,
  "export": $export,
  "use_part_of": $usePartOf,
  "use_references_list": $useReferencesList,
  "package": ${package == null ? null : '"$package"'},
  "export_file": ${exportFile == null ? null : '"$exportFile"'},
  "ignored_rules": ${ignoredRules == null || ignoredRules.isEmpty ? null : '[ "${ignoredRules.join('", "')}" ]'},
  "groups": [
    {
      "class_name": "Images",
      "path": "assets/images",
      "package": "images",
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
      "package": "svgs",
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
      "package": "ico",
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
      "package": null,
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
  }
  return '''
generate_tests: $generateTests
no_comments: $noComments
export: $export
use_part_of: $usePartOf
use_references_list: $useReferencesList
${exportFile == null ? '' : 'export_file: $exportFile'}
${package == null ? '' : 'package: $package'}
ignored_rules: ${ignoredRules == null || ignoredRules.isEmpty ? null : '[ ${ignoredRules.join(', ')} ]'}
groups:
  - class_name: Images
    package: images
    path: assets/images
    types: [ .png, .jpg, .jpeg, .webp, .webm, .bmp ]
  
  - class_name: Svgs
    package: svgs
    sub_groups:
      - path: assets/svgsMenu
        prefix: menu
        types: [ .svg ]

      - path: assets/svgsOther
        prefix: other
        types: [ .svg ]
  
  - class_name: Ico
    package: ico
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
''';
}
