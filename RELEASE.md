# How to make a release

Create a Release PR.
The release branch has to have the version in the name, because this will be used as `future_version` of the github cnahgelog generator.

```shell
git switch main
git pull -r
git switch -c release-v1.0.0

bundle config set --local path vendor/bundle
bundle config set --local with 'release'
bundle install

CHANGELOG_GITHUB_TOKEN="token_MC_tokenface" bundle exec rake changelog

git commit -am 'Release v1.0.0'
git push origin release-v1.0.0
```

After the merge do:

```shell
git switch main
git pull -r
git tag v1.0.0
git push --tags
```
