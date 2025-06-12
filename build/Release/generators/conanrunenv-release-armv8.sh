script_folder="/Users/newowner/CLionProjects/practise_1/build/Release/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanrunenv-release-armv8.sh"
for v in QT_PLUGIN_PATH PATH LD_LIBRARY_PATH DYLD_LIBRARY_PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanrunenv-release-armv8.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanrunenv-release-armv8.sh"
    fi
done


export QT_PLUGIN_PATH="/Users/newowner/.conan2/p/b/qtcb18790a86699/p/plugins"
export PATH="/Users/newowner/.conan2/p/b/qtcb18790a86699/p/bin:$PATH"
export LD_LIBRARY_PATH="/Users/newowner/.conan2/p/b/qtcb18790a86699/p/lib:/Users/newowner/.conan2/p/b/qtcb18790a86699/p/plugins/imageformats:/Users/newowner/.conan2/p/b/qtcb18790a86699/p/plugins/platforms:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/Users/newowner/.conan2/p/b/qtcb18790a86699/p/lib:/Users/newowner/.conan2/p/b/qtcb18790a86699/p/plugins/imageformats:/Users/newowner/.conan2/p/b/qtcb18790a86699/p/plugins/platforms:$DYLD_LIBRARY_PATH"