# vscode-ruby-lsp-v0.9.27
## 🐛 Bug Fixes

- Remove git scheme from document selector (https://github.com/Shopify/ruby-lsp/pull/3540) by @vinistock
- Move chruby activation script into a file (https://github.com/Shopify/ruby-lsp/pull/3551) by @vinistock
- Automatically clear Ruby workspace cache if the path no longer exists (https://github.com/Shopify/ruby-lsp/pull/3573) by @vinistock

## 📦 Other Changes

- chore: remove deprecated activationEvents from extension package.json (https://github.com/Shopify/ruby-lsp/pull/3564) by @maxveldink
- Increase the full test discovery rollout to 70% (https://github.com/Shopify/ruby-lsp/pull/3574) by @alexcrocha
- add mise install path for `apt` installations (https://github.com/Shopify/ruby-lsp/pull/3532) by @jtannas



# vscode-ruby-lsp-v0.9.26
## ✨ Enhancements

- Show progress while discovering tests (https://github.com/Shopify/ruby-lsp/pull/3519) by @vinistock

## 📦 Other Changes

- Avoid shitfting editor focus when using test code lens (https://github.com/Shopify/ruby-lsp/pull/3527) by @vinistock



# vscode-ruby-lsp-v0.9.25
## 🐛 Bug Fixes

- Always reset run object on finalize (https://github.com/Shopify/ruby-lsp/pull/3495) by @vinistock
- Use a custom executable to hook to test explorer (https://github.com/Shopify/ruby-lsp/pull/3499) by @vinistock
- Use a workspace to port map instead of single value file (https://github.com/Shopify/ruby-lsp/pull/3502) by @vinistock

## 📦 Other Changes

- Bump new explorer rollout to 15% (https://github.com/Shopify/ruby-lsp/pull/3510) by @vinistock



# vscode-ruby-lsp-v0.9.24
## 🐛 Bug Fixes

- Use a progress middleware for indexing promise (https://github.com/Shopify/ruby-lsp/pull/3484) by @vinistock

## 📦 Other Changes

- Use remaining path as test file label (https://github.com/Shopify/ruby-lsp/pull/3479) by @vinistock
- Lazily discover test framework on execution (https://github.com/Shopify/ruby-lsp/pull/3480) by @vinistock
- Enable full test discovery for 5% of users (https://github.com/Shopify/ruby-lsp/pull/3489) by @alexcrocha



# vscode-ruby-lsp-v0.9.23
## ✨ Enhancements

- Add refresh support to the test explorer (https://github.com/Shopify/ruby-lsp/pull/3463) by @vinistock
- Automatically discover dynamically defined tests (https://github.com/Shopify/ruby-lsp/pull/3430) by @vinistock

## 🐛 Bug Fixes

- Avoid resetting framework tag if finding a file with no tests (https://github.com/Shopify/ruby-lsp/pull/3467) by @vinistock



# vscode-ruby-lsp-v0.9.22


# vscode-ruby-lsp-v0.9.21
## ✨ Enhancements

- Modify LinkedCancellationSource for asymmetric token cancellation (https://github.com/Shopify/ruby-lsp/pull/3450) by @alexcrocha
- Add support for continuous test runs (https://github.com/Shopify/ruby-lsp/pull/3451) by @alexcrocha

## 🐛 Bug Fixes

- Write TCP server port to a tempfile instead of using env var (https://github.com/Shopify/ruby-lsp/pull/3452) by @vinistock
- Automatically discover children of workspace test items (https://github.com/Shopify/ruby-lsp/pull/3448) by @vinistock



# vscode-ruby-lsp-v0.9.20
## 🐛 Bug Fixes

- Include debug and spawn in the list of promises to await (https://github.com/Shopify/ruby-lsp/pull/3444) by @vinistock
- Differentiate between regular termination and cancellation (https://github.com/Shopify/ruby-lsp/pull/3446) by @vinistock



# vscode-ruby-lsp-v0.9.19
## 🐛 Bug Fixes

- Require `bundler/setup` for running tests (https://github.com/Shopify/ruby-lsp/pull/3433) by @vinistock
- Always set RUBYOPT when running tests in terminal (https://github.com/Shopify/ruby-lsp/pull/3432) by @vinistock

## 📦 Other Changes

- Show message if we cannot find related files (https://github.com/Shopify/ruby-lsp/pull/3434) by @vinistock



# vscode-ruby-lsp-v0.9.18
## ✨ Enhancements

- Make run in terminal a proper explorer profile (https://github.com/Shopify/ruby-lsp/pull/3425) by @vinistock
- Connect code lens buttons to the new explorer (https://github.com/Shopify/ruby-lsp/pull/3426) by @vinistock



# vscode-ruby-lsp-v0.9.17
## 🐛 Bug Fixes

- Consider local variables prefixed with underscore in grammar (https://github.com/Shopify/ruby-lsp/pull/3408) by @vinistock
- Consider `_` as a local variable in the grammar (https://github.com/Shopify/ruby-lsp/pull/3415) by @vinistock

## 📦 Other Changes

- Add server capability for full test discovery (https://github.com/Shopify/ruby-lsp/pull/3410) by @vinistock
- Use a TCP server to listen to streaming test events (https://github.com/Shopify/ruby-lsp/pull/3388) by @vinistock



# vscode-ruby-lsp-v0.9.16
## ✨ Enhancements

- Highlight multiline RBS signature syntax (https://github.com/Shopify/ruby-lsp/pull/3391) by @Morriar

## 🐛 Bug Fixes

- Fix RBS highlighting in Ruby regexes (https://github.com/Shopify/ruby-lsp/pull/3390) by @Morriar



# vscode-ruby-lsp-v0.9.15
## 🐛 Bug Fixes

- Fix heredoc syntax highlighting (https://github.com/Shopify/ruby-lsp/pull/3389) by @Morriar



# vscode-ruby-lsp-v0.9.14
## ✨ Enhancements

- Add test run durations to status updates (https://github.com/Shopify/ruby-lsp/pull/3368) by @vinistock

## 📦 Other Changes

- Allow test run cancellation in Test Results panel (https://github.com/Shopify/ruby-lsp/pull/3343) by @alexcrocha



# vscode-ruby-lsp-v0.9.13
## ✨ Enhancements

- Introduce test file watcher (https://github.com/Shopify/ruby-lsp/pull/3326) by @alexcrocha
- Implement debug handler based on command resolution (https://github.com/Shopify/ruby-lsp/pull/3354) by @vinistock
- Auto resolve first test file of each top level directory (https://github.com/Shopify/ruby-lsp/pull/3349) by @vinistock
- Implement test coverage profile for the explorer (https://github.com/Shopify/ruby-lsp/pull/3361) by @vinistock

## 🐛 Bug Fixes

- Remove workspace from map when not eagerly activating (https://github.com/Shopify/ruby-lsp/pull/3352) by @vinistock
- Apply debug env customizations on top of Ruby environment (https://github.com/Shopify/ruby-lsp/pull/3353) by @vinistock

## 📦 Other Changes

- Add telemetry for the new test explorer usage (https://github.com/Shopify/ruby-lsp/pull/3362) by @vinistock



# vscode-ruby-lsp-v0.9.12
## 🐛 Bug Fixes

- Avoiding rejecting promise if test command failed (https://github.com/Shopify/ruby-lsp/pull/3334) by @vinistock
- Automatically discover children for test files that weren't expanded (https://github.com/Shopify/ruby-lsp/pull/3336) by @vinistock

## 📦 Other Changes

- Allow cancelling test runs (https://github.com/Shopify/ruby-lsp/pull/3338) by @vinistock
- Use abort controller as signal to cancel test execution (https://github.com/Shopify/ruby-lsp/pull/3341) by @vinistock



# vscode-ruby-lsp-v0.9.11
## ✨ Enhancements

- Add support for appendOutput to streaming explorer updates (https://github.com/Shopify/ruby-lsp/pull/3323) by @vinistock

## 🐛 Bug Fixes

- Use map compact instead of filter_map in activation script (https://github.com/Shopify/ruby-lsp/pull/3321) by @vinistock
- Do not include workspace name as part of relative path (https://github.com/Shopify/ruby-lsp/pull/3329) by @vinistock
- Accumulate streaming promises and await all before exiting (https://github.com/Shopify/ruby-lsp/pull/3330) by @vinistock



# vscode-ruby-lsp-v0.9.9
## ✨ Enhancements

- Add new run handler for test controller (https://github.com/Shopify/ruby-lsp/pull/3251) by @vinistock

## 🐛 Bug Fixes

- Add icon for GoToRelevantFile in vscode (https://github.com/Shopify/ruby-lsp/pull/3320) by @jenny-codes


