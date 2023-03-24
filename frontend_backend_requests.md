# Communication between frontend and backend

Let's look at two examples of how we can send and receive data from our frontend using HTTP requests.

## Key functionality

- `url`: Address to which we communicate with the server. This determines which values we need to send and in which format to get our requests through. See [backend main.py](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker-server/blob/main/src/main.py). Emulator local address: http://10.0.2.2:8008
- `userID`: Usually needed to get the data to the right address.
- `settings`: HTTP request configuration.
- `body: JSON.stringify()`: (Currently using only headers to send our data) Puts our data to the correct format for our server to use.
- `try{} catch{}`: If there is and error with our HTTP request we can see it.
- `async await`: React Native's way to stop a task until a response.
- `fetch()`: React Native's way to handle HTTP requests. See [React Native Networking documentation](https://reactnative.dev/docs/network)

## POST example

```typescript
const postCoordsToServer = async ({userID, coordinate}) => {
	const url = `http://berry-picker-tracker.cs.helsinki.fi/create-waypoint`;
	const settings = {
		method: "POST",
		headers: {
			Accept: "application/json",
			"Content-Type": "application/json",
		},
		body: JSON.stringify({
			userid: userID
			latitude: coordinate.latitude,
			longitude: coordinate.longitude,
		}),
	};
	try {
		const response = await fetch(url, settings);
		console.log("Sent to server (userid, lat, long):", userID, coordinate.latitude, coordinate.longitude);
		const data = await response.json();
		console.log("Response:", data);
	} catch (error) {
		console.log(error);
	}
};

```

## GET example

```typescript
const getCoordsFromServer = async (userID) => {
	const url = `http://berry-picker-tracker.cs.helsinki.fi/get-user-routes/{userID}`;
	const settings = {
		method: "GET",
		headers: {
			Accept: "application/json",
			"Content-Type": "application/json",
		},
	};
	try {
		const response = await fetch(url, settings);
		const data = await response.json();
		console.log("Response:", data);
		return (data)
	} catch (error) {
		console.log(error);
	}
};

```
