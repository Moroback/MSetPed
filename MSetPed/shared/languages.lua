Languages = {
    ["fr"] = {
        notAuthorized = "Vous n'avez pas l'autorisation d'utiliser cette commande.",
        incorrectUsage = "Utilisation incorrecte. Utilisez: /setped <id> <nom_du_ped>",
        playerNotFound = "Joueur non trouvé.",
        invalidPedModel = "Modèle de ped invalide.",
        pedChangedSuccess = "Modèle de ped changé avec succès !",
        pedChangedTarget = "Votre modèle de ped a été changé."
    },
    ["en"] = {
        notAuthorized = "You are not authorized to use this command.",
        incorrectUsage = "Incorrect usage. Use: /setped <id> <ped_name>",
        playerNotFound = "Player not found.",
        invalidPedModel = "Invalid ped model.",
        pedChangedSuccess = "Ped model changed successfully!",
        pedChangedTarget = "Your ped model has been changed."
    }
}

function Translate(msgKey)
    local lang = Config.Language
    return Languages[lang][msgKey] or Languages["en"][msgKey]
end
