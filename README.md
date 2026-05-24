# VCSI Docker

This repository builds a small Docker image for [vcsi](https://github.com/amietn/vcsi), a tool that creates video contact sheets.

## Build

Build the image from the repository root:

```bash
docker build -t vcsi-docker .
```

## Run

Run `vcsi` against a video file by mounting the current directory into the container:

```bash
docker run --rm -v "$PWD:/work" vcsi-docker vcsi input.mp4 -o output.jpg
```

Run `vcsi` across every video in the current directory (without recursive mode):

```bash
docker run --rm -v "$PWD:/work" vcsi-docker vcsi . -o .
```

If you want an interactive shell entry point, you can also pass any `vcsi` arguments directly:

```bash
docker run --rm -v "$PWD:/work" vcsi-docker vcsi --help
```

If you want to open a shell in the container first, use `-it` and `/bin/bash`:

```bash
docker run --rm -it -v "$PWD:/work" vcsi-docker /bin/bash
```

## Useful Flags

These are some of the most useful options from the upstream `vcsi` README:

- `-o, --output` - output file path
- `-w, --width` - width of the generated contact sheet
- `-g, --grid` - grid size, for example `4x4`
- `-t, --show-timestamp` - show timestamps on each frame
- `-s, --num-samples` - number of samples to capture
- `-a, --accurate` - slower but more accurate frame capture
- `-A, --accurate-delay-seconds` - decode a short window before each capture when using accurate mode
- `-r, --recursive` - process directories recursively
- `--fast` - prioritize speed over output quality
- `-S, --actual-size` - use full-size thumbnails
- `-O, --thumbnail-output` - keep thumbnails in a directory instead of deleting them
- `--interval` - capture frames at a fixed interval
- `--frame-type` - capture only a given frame type such as `I`, `B`, `P`, or `key`
- `--timestamp-format` - customize timestamp text
- `--metadata-position` - place metadata at `top`, `bottom`, or `hidden`
- `--background-color` - set the background color
- `--metadata-font-color` - set metadata text color
- `--timestamp-font-color` - set timestamp text color
- `--timestamp-background-color` - set the timestamp background color
- `--timestamp-border-mode` - draw timestamp text with a border instead of a rectangle
- `--timestamp-border-size` - set timestamp border thickness
- `--template` - use a custom metadata template

For the full upstream flag list, run:

```bash
docker run --rm -v "$PWD:/work" vcsi-docker vcsi --help
```

## License

This image installs the upstream [vcsi](https://github.com/amietn/vcsi) project,
which is licensed under MIT. If you redistribute this repository or a built
image, keep the upstream license notice and attribution with the distribution.
