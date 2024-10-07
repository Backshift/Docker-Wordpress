target_dir="wordpress/app"
config_file="config/wp-config-docker.php"

if [ -f "$config_file" ]; then
    echo "Copying custom wp-config-docker.php to $target_dir/wp-config.php..."
    cp "$config_file" "$target_dir/wp-config.php"
else
    echo "Error: $config_file not found. Skipping wp-config.php replacement."
    exit 1
fi