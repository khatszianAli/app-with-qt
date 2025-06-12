script_folder="/Users/newowner/CLionProjects/practise_1/build/Release/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanbuildenv-release-armv8.sh"
for v in QT_PLUGIN_PATH QT_HOST_PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanbuildenv-release-armv8.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanbuildenv-release-armv8.sh"
    fi
done


export QT_PLUGIN_PATH="/Users/newowner/.conan2/p/b/qtcb18790a86699/p/plugins"
export QT_HOST_PATH="/Users/newowner/.conan2/p/b/qtcb18790a86699/p"