input = {}

function input.load()
    function input:get(input)
        local values
        for key, value in pairs(self) do
            if input == key then
                values = value
            end
        end
        if values == nil then
            return nil
        else
            return unpack(values)
        end
    end
end
