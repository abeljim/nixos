{
  programs.nixvim.plugins.codecompanion = {
    enable = true;

    settings = {
      opts = {
        log_level = "TRACE";
        send_code = true;
        use_default_actions = true;
        use_default_prompts = true;
      };
      strategies = {
        agent = {
          adapter = "anthropic";
        };
        chat = {
          adapter = "anthropic";
        };
        inline = {
          adapter = "anthropic";
        };
      };
    };
  };
}
