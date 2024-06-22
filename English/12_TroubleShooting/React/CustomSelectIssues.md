[Back](README.md)

## Custom Select Issues

<hr>


### 1. Can not select value

- General Tips for Similar Issues

    > **Ensure the name attribute in form elements matches the corresponding state fields,** this is crucial for the handleChange function to correctly update the state.


- Type Safety

    > Make sure your handleChange function can handle various input types, especially when dealing with Select elements.

- Component Structure

    > Organize your components so that each handles a specific piece of functionality, making debugging easier.

- State Management

    > When working with forms, use state hooks effectively to manage the form's state and ensure updates are correctly reflected.

- Example Application
    ```typescript
    // ExampleListComponent.tsx
    import Box from '@mui/material/Box';
    import InputLabel from '@mui/material/InputLabel';
    import MenuItem from '@mui/material/MenuItem';
    import FormControl from '@mui/material/FormControl';
    import Select from '@mui/material/Select';
    import { useQuery } from '@tanstack/react-query';
    import { getExampleData } from "../api/ExampleApi";

    type DialogFormProps = {
        exampleId: number;
        handleChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
    }

    function ExampleListComponent({ exampleId, handleChange }: DialogFormProps) {
        const { data, error, isSuccess } = useQuery({
            queryKey: ["exampleData"], 
            queryFn: getExampleData
        });

        if (!isSuccess) {
            return <span>Loading...</span>
        } else if (error) {
            return <span>Error when fetching data...</span>
        } else if (data.code !== "0") {
            return <span>{data.message}</span>
        } else {
            return (
                <Box sx={{ minWidth: 120 }}>
                    <FormControl fullWidth>
                        <InputLabel id="example-select-label">Example Data</InputLabel>
                        <Select
                            labelId="example-select-label"
                            id="example-select"
                            name="exampleId"  // Ensure this matches the state field
                            value={exampleId}
                            label="Example Data"
                            onChange={handleChange}
                        >
                            {data.data.map(item => (
                                <MenuItem key={item.id} value={item.id}>{item.name}</MenuItem>
                            ))}
                        </Select>
                    </FormControl>
                </Box>
            );
        }
    }

    export default ExampleListComponent;
    ```


