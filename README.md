# CV

All files for my CV. The document is written in [typst](https://typst.app/) using the
[imprecv template](https://vale.sh/docs/formats/markdown). Linting is performed
[with vale](https://vale.sh/docs/formats/markdown).

## Development

```sh
make build
```

## Dependencies

- [docker](https://docs.docker.com/engine/install/): used for building and linting

## Infrastructure

### Terraform

Generate a Github token with the follow permissions:

- `repo:public_repo`
- `read:org`
