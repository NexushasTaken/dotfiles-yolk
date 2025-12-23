export let data = #{
  git: #{
    name: "NexushasTaken",
    email: "nexushastaken@gmail.com",
  },
  font: "Hack Nerd Font",
  cursor: #{
    name: "phinger-cursor-dark",
    size: 16,
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
  kanata: #{
    enabled: true,
    targets: "~/.config/kanata",
  },
  tmux: #{
    enabled: true,
    targets: "~/.config/tmux",
  },
  ranger: #{
    enabled: true,
    targets: "~/.config/ranger",
  },
  gdb: #{
    enabled: true,
    targets: "~/.config/gdb",
  },

  hypr: #{
    enabled: true,
    targets: "~/.config/hypr",
    templates: [
      "hyprland.conf",
    ],
  },
  uwsm: #{
    enabled: true,
    targets: "~/.config/uwsm",
    templates: [
      "env",
      "env-hyprland",
    ],
  },
  dunst: #{
    enabled: true,
    targets: "~/.config/dunst",
  },
  waybar: #{
    enabled: true,
    targets: "~/.config/waybar",
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
