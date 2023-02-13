# Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false

# Display username always
SPACESHIP_USER_SHOW=never

SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIX_SHOW=false
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "
SPACESHIP_DIR_COLOR=243
SPACESHIP_NODE_SHOW=true

SPACESHIP_PACKAGE_PREFIX="- "
SPACESHIP_PACKAGE_SUFFIX=" - "
SPACESHIP_PACKAGE_COLOR="yellow"


SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  bun           # Bun section
  deno          # Deno section
  ruby          # Ruby section
  python        # Python section
  elm           # Elm section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  java          # Java section
  julia         # Julia section
  crystal       # Crystal section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  dotnet        # .NET section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  async         # Async jobs indicator
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

