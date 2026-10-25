<?php
// Copy to config.php locally and replace placeholders. Never commit config.php.
return [
    'db' => [
        'host' => '127.0.0.1',
        'name' => 'sarajevo_dancehub',
        'user' => 'your_database_user',
        'password' => 'your_database_password',
        'charset' => 'utf8mb4',
    ],
    'jwt' => [
        'secret' => 'replace_with_a_long_random_secret',
        'issuer' => 'sarajevo-dancehub',
        'expires_in' => 3600,
    ],
    'external_api' => [
        'nominatim_base_url' => 'https://nominatim.openstreetmap.org',
        'user_agent' => 'SarajevoDanceHub/1.0 (contact: replace-with-your-email@example.com)',
    ],
];
