let terminal_themes = #{
  dark: #{
    // Default colors
    primary: #{
      background: "#1a1b26",
      foreground: "#c0caf5",
    },
    cursor: #{
      cursor: "#c0caf5",
      text: "#1a1b26",
    },

    // Normal colors
    normal: #{
      black: "#15161e",
      red: "#f7768e",
      green: "#9ece6a",
      yellow: "#e0af68",
      blue: "#7aa2f7",
      magenta: "#bb9af7",
      cyan: "#7dcfff",
      white: "#a9b1d6",
    },

    // Bright colors
    bright: #{
      black: "#414868",
      red: "#ff899d",
      green: "#9fe044",
      yellow: "#faba4a",
      blue: "#8db0ff",
      magenta: "#c7a9ff",
      cyan: "#a4daff",
      white: "#c0caf5",
    },

    // Indexed Colors
    //indexed_colors: #{
    // index: 16,
    // color: "#ff9e64",
    //},

    //indexed_colors: #{
    //  index: 17,
    //  color: "#db4b4b",
    //},
  },
};

export let data = #{
  git: #{
    name: "NexushasTaken",
    email: "nexushastaken@gmail.com",
  },
  font: "Hack Nerd Font",
  themes: #{
    terminal: terminal_themes.dark,
  },
};

export let eggs = #{
  home: #{
    enabled: true,
    targets: "~",
    strategy: "merge",
    unsafe_shell_hooks: #{
      post_deploy: "./bin/archlinux.sh",
    },
  },

  git: #{
    enabled: true,
    targets: "~/.config/git",
    templates: [
      "config",
    ],
  },
  bat: #{
    enabled: true,
    targets: "~/.config/bat",
  },

  bash: #{
    enabled: true,
    targets: #{
      "bashrc.sh": "~/.bashrc",
      "bash_profile.sh": "~/.bash_profile",
      ".": "~/.config/bash",
    },
  },
  btop: #{
    enabled: true,
    targets: "~/.config/btop",
  },
  alacritty: #{
    enabled: true,
    targets: "~/.config/alacritty",
    templates: [
      "alacritty.toml",
    ],
  },

  lazygit: #{
    enabled: true,
    targets: "~/.config/lazygit",
  },
  superfile: #{
    enabled: true,
    targets: "~/.config/superfile",
  },
  gh: #{
    enabled: true,
    strategy: "merge",
    targets: "~/.config/gh",
    unsafe_shell_hooks: #{
      pre_deploy: "./bin/gh/pre_deploy.sh",
      post_undeploy: "./bin/gh/post_undeploy.sh",
    },
  },
  clangd: #{
    enabled: true,
    targets: "~/.config/clangd",
  },
};
