use zed_extension_api as zed;
use crate::zed::LanguageServerId;
use zed_extension_api::settings::LspSettings;
use std::path::PathBuf;

struct SpadeExtension {}

impl SpadeExtension {
    pub const SERVER_ID: &'static str = "spade-language-server";

    fn language_server_binary(
        &self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed_extension_api::Result<String> {
        let lsp_settings = LspSettings::for_worktree(language_server_id.as_ref(), worktree)?;

        if let Some(binary_settings) = lsp_settings.binary {
            if let Some(path) = binary_settings.path {
                return Ok(path);
            }
        }

        if let Some(path) = worktree.which(Self::SERVER_ID) {
            return Ok(path);
        }

        if worktree.read_text_file("swim.toml").is_ok() {
            return Ok(
                PathBuf::from(&worktree.root_path())
                    .join(format!("build/spade/target/release/{}", Self::SERVER_ID))
                    .to_string_lossy().to_string()
            );
        }

        Err(format!("Could not find {}", Self::SERVER_ID))
    }
}

impl zed::Extension for SpadeExtension {
    fn new() -> Self {
        Self {}
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command, String> {
        Ok(zed::Command {
            command: self.language_server_binary(language_server_id, worktree)?,
            args: vec![],
            env: worktree.shell_env(),
        })
    }
}

zed::register_extension!(SpadeExtension);
