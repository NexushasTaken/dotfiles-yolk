export let data = #{
  git: #{
    name: "NexushasTaken",
    email: "nexushastaken@gmail.com",
  },
};

export let eggs = #{
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
};
